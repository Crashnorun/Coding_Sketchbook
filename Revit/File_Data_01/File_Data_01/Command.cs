#region Namespaces
using System;
using System.Collections.Generic;
using System.Diagnostics;
using Autodesk.Revit.ApplicationServices;
using Autodesk.Revit.Attributes;
using Autodesk.Revit.DB;
using Autodesk.Revit.UI;
using Autodesk.Revit.UI.Selection;
#endregion

namespace File_Data_01
{
    [Transaction(TransactionMode.Manual)]
    public class Command : IExternalCommand
    {
        public Result Execute(
          ExternalCommandData commandData,
          ref string message,
          ElementSet elements)
        {
            UIApplication uiapp = commandData.Application;
            Application app = uiapp.Application;
            UIDocument uidoc = uiapp.ActiveUIDocument;

            if (uidoc == null)
            {
                Debug.Print("Could not find any open Revit documents");
                return Result.Cancelled;
            }
            Document doc = uidoc.Document;

            FamilySymbolData(doc);
            FamilyInstanceData(doc);
            Debug.Print("---- DONE ----");

            /*  using (Transaction tx = new Transaction(doc))
              {
                  tx.Start("Transaction Name");
                  tx.Commit();
              }*/

            return Result.Succeeded;
        }


        // find all family symbols
        public void FamilySymbolData(Document doc)
        {
            FilteredElementCollector col = new FilteredElementCollector(doc)
                 .OfClass(typeof(FamilySymbol));

            foreach (Element e in col)
            {
                FamilySymbol sym = e as FamilySymbol;

                try
                {
                    Document famDoc = doc.EditFamily(sym.Family);

                    WorksharingTooltipInfo info = WorksharingUtils.GetWorksharingTooltipInfo(doc, sym.Id);

                    if (famDoc == null)
                    {
                        Debug.Print(string.Format("FamilyName: {0}, Name: {1}, Creator: {2}, Owner: {3}, Last Edited By: {4}, FilePath: {5}",
                        sym.FamilyName, sym.Name, info.Creator, info.Owner, info.LastChangedBy, "NA"));
                    }
                    else
                    {
                        Debug.Print(string.Format("FamilyName: {0}, Name: {1}, Creator: {2}, Owner: {3}, Last Edited By: {4}, FilePath: {5}",
                        sym.FamilyName, sym.Name, info.Creator, info.Owner, info.LastChangedBy, famDoc.PathName));
                    }


                }
                catch (Exception ex)
                {

                }
            }
        }

        public void FamilyInstanceData(Document doc)
        {
            FilteredElementCollector col = new FilteredElementCollector(doc)
                .OfClass(typeof(FamilyInstance));

            foreach (Element e in col)
            {
                FamilyInstance inst = e as FamilyInstance;

                try
                {
                    WorksharingTooltipInfo info = WorksharingUtils.GetWorksharingTooltipInfo(doc, inst.Id);

                    Debug.Print(string.Format("Name: {0}, Creator: {1}, Owner: {2}, Last Edited By: {3}",
                    inst.Name, info.Creator, info.Owner, info.LastChangedBy));

                }
                catch (Exception ex)
                {

                }
            }

        }

    }
}

/*
 * References
 * Family file path: https://adndevblog.typepad.com/aec/2012/09/accessing-the-path-a-revit-family-document-from-the-family-instance.html
 * Worksharing properties: https://www.revitapidocs.com/2019/c6d2a047-8f18-103a-804d-cd2a0ff43c40.htm
 */
