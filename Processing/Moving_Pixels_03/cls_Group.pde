import java.util.*;

class cls_Group {

  //----GLOBAL VARIABLES----
  String GroupName;
  PVector cent;
  int Length;
  List<cls_Pxl> temp = new ArrayList<cls_Pxl>();
  cls_Pxl[] pxls = {
  };
  //----GLOBAL VARIABLES----


  //----------------------------------------------------------------------
  cls_Group(String name) {
    GroupName = name;
  }
  //----------------------------------------------------------------------


  //----FIND CENT OF GROUP------------------------------------------------------------------
  void FindCent() {
    int X = 0;
    int Y = 0;

    for (int i = 0; i< pxls.length; i++) {
      X+= pxls[i].posX ;
      Y+= pxls[i].posY ;
    }  
    X = X/pxls.length;
    Y = Y/pxls.length;

    cent = new PVector(X, Y);
    //cent.mult(2);
    println("GROUP " + GroupName + " CENT X = " + cent.x + " CENT Y = " + cent.y);
  }
  //----------------------------------------------------------------------


  //----------------------------------------------------------------------
  // add pixel to array
  void Append(cls_Pxl Pixel) {
    temp.add(Pixel);                       // add the pixel to the list
    pxls = new cls_Pxl[temp.size()];       // resize array
    temp.toArray(pxls);                    // turn list into array
    Length = temp.size();
  }
  //----------------------------------------------------------------------
}    // close class

