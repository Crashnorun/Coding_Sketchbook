#region Namespaces
using System;
using System.Collections.Generic;
using System.Diagnostics;
using Autodesk.Revit.ApplicationServices;
using Autodesk.Revit.Attributes;
using Autodesk.Revit.DB;
using Autodesk.Revit.DB.Architecture;
using Autodesk.Revit.UI;
using Autodesk.Revit.UI.Selection;
#endregion

namespace Rooms_Extract_Data
{
    [Transaction(TransactionMode.Manual)]
    public class Command : IExternalCommand
    {
        //string FileName = @"C:\Users\cportelli\Documents\Personal\GitHub\Coding_Sketchbook\Revit\Rooms_Extract_Data\Models\Simple_Room_01.rvt";
        public string FileName = Properties.Resources.FileName_BasicRooms;


        public Result Execute(
          ExternalCommandData commandData,
          ref string message,
          ElementSet elements)
        {
            UIApplication uiapp = commandData.Application;              // access to the main window and active document
            Application app = uiapp.Application;                        // current application

            if (uiapp.ActiveUIDocument == null) uiapp.OpenAndActivateDocument(FileName);

            UIDocument uidoc = uiapp.ActiveUIDocument;                  //  current active project
            Document doc = uidoc.Document;                              // databse level document

            // Access current selection
            // Selection sel = uidoc.Selection;

            // Retrieve elements from database
            /*FilteredElementCollector col = new FilteredElementCollector(doc)
                .WhereElementIsNotElementType()
                .OfCategory(BuiltInCategory.INVALID)
                .OfClass(typeof(Room));*/

            FilteredElementCollector col = new FilteredElementCollector(doc)
            .WhereElementIsNotElementType()
            .OfCategory(BuiltInCategory.OST_Rooms);

            // Filtered element collector is iterable
            foreach (Element e in col)
            {
                Debug.Print(e.Name);
                Room rm = e as Room;
                BoundingBoxXYZ boundingBox = rm.ClosedShell.GetBoundingBox();
                XYZ minPt = boundingBox.Min;
                XYZ maxPt = boundingBox.Max;

                Options options = new Options();
                options.ComputeReferences = true;
                //options.View = doc.ActiveView;
                options.IncludeNonVisibleObjects = true;
                options.DetailLevel = ViewDetailLevel.Fine;
                
                GeometryElement geo = rm.get_Geometry(options);
                foreach(GeometryObject obj in geo)
                {
                    Solid solid = obj as Solid;
                    if (solid != null)
                    {
                        EdgeArray ea = solid.Edges;
                        if(ea!= null)
                        {
                            foreach (Edge ed in ea)
                            {
                                Curve crv = ed.AsCurve();
                                Line ln = crv as Line;
                                if(ln != null)
                                {
                                    Debug.Print(string.Format("Startpoint {0} Endpoint {1}",ln.GetEndPoint(0).ToString(), ln.GetEndPoint(1)));
                                }
                            }
                        }
                    }
                }
            }
               

            // Modify document within a transaction

          /*  using (Transaction tx = new Transaction(doc))
            {
                tx.Start("Transaction Name");

                foreach (Element e in col)
                    e.Name = "Charlie";

                tx.Commit();
            }*/

            return Result.Succeeded;
        }
    }
}
