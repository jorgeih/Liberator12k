//$t=0.7267;
include <../../Meta/Animation.scad>;

use <../../Meta/Debug.scad>;
use <../../Meta/Manifold.scad>;
use <../../Meta/Resolution.scad>;

use <../../Vitamins/Pipe.scad>;
use <../../Vitamins/Rod.scad>;
use <../../Vitamins/Double Shaft Collar.scad>;

use <../../Lower/Receiver Lugs.scad>;
use <../../Lower/Trigger.scad>;
use <../../Lower/Lower.scad>;

use <../../Reference.scad>;

use <../../Upper/Cross Fitting/Charger.scad>;
use <../../Upper/Cross Fitting/Cross Upper.scad>;
use <../../Upper/Cross Fitting/Frame.scad>;
use <../../Upper/Cross Fitting/Forend/Barrel Lugs.scad>;
use <../../Upper/Cross Fitting/Forend/Forend.scad>;
use <../../Upper/Cross Fitting/Forend/Forend Pivoted 608.scad>;
use <../../Upper/Cross Fitting/Forend/Forend Slotted.scad>;
use <../../Upper/Cross Fitting/Firing Pin Guide.scad>;
use <../../Upper/Cross Fitting/Sear Bolts.scad>;
use <../../Upper/Cross Fitting/Sear Guide.scad>;
use <../../Upper/Cross Fitting/Striker.scad>;

//echo($vpr);

//$vpr = [80, 0, 360*$t];

function SearLength() = 2;

module Liberator12k_PlainFrame() {
  Frame();

  // Rear Frame Nuts
  translate([ReceiverLugRearMinX(),0,0])
  mirror([1,0,0])
  FrameNuts();

  // Front Frame Nuts
  translate([FrameRodLength()+OffsetFrameBack()-ManifoldGap(),0,0])
  mirror([1,0,0])
  FrameNuts();
}


module Liberator12k_Base() {

  Breech();

  ChargingHandle();
  ChargingInsert();

  Striker();
  SearBolts();

  translate([0,0,-ReceiverCenter()]) {
    Sear();
    SearSupportTab();
    Trigger();
  }

  translate([0,0,-ManifoldGap()])
  SearGuide();

  FiringPinGuide(debug=true);

  Receiver(alpha=0.5);

  CrossInserts(alpha=0.5);
  CrossUpperFront(alpha=0.25);
  CrossUpperBack(alpha=0.25);

  // Lower
  translate([0,0,-ReceiverCenter()]) {
    ReceiverLugBoltHoles(clearance=false);
    GuardBolt(clearance=false);
    HandleBolts(clearance=false);
    Lower(showTrigger=false);
  }
}

module Liberator12k_Stock() {
  Stock(alpha=0.5);
  Butt(alpha=0.5);
}

module Liberator12k_Pistol() {
  Stock(alpha=0.5);
  PipeCap(pipeSpec=DEFAULT_BARREL);
  Butt(alpha=0.5);
}

Liberator12k_PlainFrame();
Liberator12k_Base();
Liberator12k_Stock();

