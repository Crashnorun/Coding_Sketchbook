
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
    // strokeWeight(Thickness);
    arc(0, 0, Radius, Radius, radians(Start), radians(Angle));
    arc(0, 0, Radius + Thickness, Radius + Thickness, radians(Start), radians(Angle));
    rotate(radians(Start));
    line(Radius/2, 0, (Radius + Thickness)/2, 0);
    rotate(radians(Angle-Start));
    line(Radius/2, 0, (Radius + Thickness)/2, 0);
  }

  void Update() {
    Start += Speed;
    Angle += Speed;
  }
}
