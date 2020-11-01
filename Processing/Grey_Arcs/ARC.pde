
class ARC {

  float Radius;
  float Angle;
  float Speed;
  boolean Filled;
  boolean Clockwise;
  float Start = 0;

  ARC(float Radius, float Angle, float Speed, boolean Filled, boolean Clockwise) {
    this.Radius = Radius;
    this.Angle =Angle;
    this.Speed = Speed;
    this.Filled = Filled;
    this.Clockwise = Clockwise;
  }

  void Render() {
   // arc(0, 0, 100, 100, 0, HALF_PI);
   noFill();
   arc(0,0,Radius, Radius, 0, radians(Angle));
  }
  
  void Update(){
    Start += Speed;
    Angle += Speed;
  }
}
