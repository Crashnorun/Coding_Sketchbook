
class ARC {

  float Radius;
  float Angle;
  float Speed;
  boolean Filled;
  boolean Clockwise;
  float Start;
  float Thickness;

  ARC(float Radius, float Start, float Angle, float Speed, boolean Filled, boolean Clockwise, float Thickness) {
    this.Radius = Radius;
    this.Start = Start;
    this.Angle = Angle;
    this.Speed = Speed;
    this.Filled = Filled;
    this.Clockwise = Clockwise;
    this.Thickness = Thickness;
  }

  void Render() {
    // arc(0, 0, 100, 100, 0, HALF_PI);
    noFill();
    strokeWeight(Thickness);
    arc(0, 0, Radius, Radius, radians(Start), radians(Angle));
  }

  void Update() {
    Start += Speed;
    Angle += Speed;

   // if (Start >= 360) Start = 0;
  //  if (Angle >= 360) Angle = 0;
  }
}
