package AES_project
  package ElecSys_power_frequency_control
    model BO_rigid_two_generators_PriSec
      extends AES.Icons.CourseworkModel;
      Modelica.Blocks.Sources.RealExpression DPe(y = if time < 10 then 0 else 5e6) annotation(
        Placement(visible = true, transformation(origin = {68, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Feedback Pbal annotation(
        Placement(transformation(origin = {130, -20}, extent = {{-10, 10}, {10, -10}})));
      Modelica.Blocks.Math.Gain fb(k = -1) annotation(
        Placement(transformation(origin = {66, -112}, extent = {{10, -10}, {-10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction g1(a = {80, 24, 1}, b = {1}) annotation(
        Placement(visible = true, transformation(origin = {-12, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction g2(a = {80, 24, 1}, b = {1}) annotation(
        Placement(visible = true, transformation(origin = {-12, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain Pn1(k = 50e6) annotation(
        Placement(visible = true, transformation(origin = {28, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain Pn2(k = 100e6) annotation(
        Placement(visible = true, transformation(origin = {28, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add as1 annotation(
        Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add as2 annotation(
        Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain beta1(k = 1.8588e-4) annotation(
        Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Math.Gain beta2(k = 9.2941e-5) annotation(
        Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Continuous.Integrator Cs(k = 5e1) annotation(
        Placement(transformation(origin = {-154, 86}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction Cp1(a = {1}, b = {1.0838}) annotation(
        Placement(visible = true, transformation(origin = {-150, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction Cp2(a = {1}, b = {0.5419}) annotation(
        Placement(visible = true, transformation(origin = {-150, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add3 add3 annotation(
        Placement(transformation(origin = {102, -20}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Add as3 annotation(
        Placement(transformation(origin = {-14, -80}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Gain beta3(k = 7.7451e-5) annotation(
        Placement(transformation(origin = {-32, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Continuous.TransferFunction g3(a = {80, 24, 1}, b = {1}) annotation(
        Placement(transformation(origin = {20, -80}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Gain Pn3(k = 120e6) annotation(
        Placement(transformation(origin = {50, -80}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction Cp3(a = {1}, b = {0.4516}) annotation(
        Placement(transformation(origin = {-152, -88}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.TransferFunction Net(a = {(55000*(2*3.14*50)^2), 0}, b = {1}) annotation(
        Placement(transformation(origin = {160, -22}, extent = {{-10, -10}, {10, 10}})));
    equation
      connect(DPe.y, Pbal.u2) annotation(
        Line(points = {{79, 20}, {121, 20}, {121, -12}, {130, -12}}, color = {0, 0, 127}));
      connect(g1.y, Pn1.u) annotation(
        Line(points = {{-1, 0}, {15, 0}}, color = {0, 0, 127}));
      connect(g2.y, Pn2.u) annotation(
        Line(points = {{-1, -40}, {15, -40}}, color = {0, 0, 127}));
      connect(beta2.y, as2.u1) annotation(
        Line(points = {{-70, 39}, {-70, -34}, {-62, -34}}, color = {0, 0, 127}));
      connect(beta1.y, as1.u1) annotation(
        Line(points = {{-110, 39}, {-110, 6}, {-102, 6}}, color = {0, 0, 127}));
      connect(as1.y, g1.u) annotation(
        Line(points = {{-79, 0}, {-25, 0}}, color = {0, 0, 127}));
      connect(Cp1.y, as1.u2) annotation(
        Line(points = {{-138, -6}, {-102, -6}}, color = {0, 0, 127}));
      connect(Cp2.y, as2.u2) annotation(
        Line(points = {{-139, -46}, {-62, -46}}, color = {0, 0, 127}));
      connect(fb.y, Cp2.u) annotation(
        Line(points = {{55, -112}, {-180, -112}, {-180, -46}, {-162, -46}}, color = {0, 0, 127}));
      connect(Cp2.u, Cp1.u) annotation(
        Line(points = {{-162, -46}, {-180, -46}, {-180, -6}, {-162, -6}}, color = {0, 0, 127}));
      connect(Cp1.u, Cs.u) annotation(
        Line(points = {{-162, -6}, {-180, -6}, {-180, 86}, {-166, 86}}, color = {0, 0, 127}));
      connect(as2.y, g2.u) annotation(
        Line(points = {{-39, -40}, {-24, -40}}, color = {0, 0, 127}));
      connect(add3.y, Pbal.u1) annotation(
        Line(points = {{113, -20}, {122, -20}}, color = {0, 0, 127}));
      connect(Pn1.y, add3.u1) annotation(
        Line(points = {{40, 0}, {90, 0}, {90, -12}}, color = {0, 0, 127}));
      connect(Pn2.y, add3.u2) annotation(
        Line(points = {{40, -40}, {56, -40}, {56, -20}, {90, -20}}, color = {0, 0, 127}));
      connect(g3.y, Pn3.u) annotation(
        Line(points = {{31, -80}, {38, -80}}, color = {0, 0, 127}));
      connect(Cp3.u, fb.y) annotation(
        Line(points = {{-164, -88}, {-180, -88}, {-180, -112}, {56, -112}}, color = {0, 0, 127}));
      connect(Cp3.y, as3.u2) annotation(
        Line(points = {{-140, -88}, {-26, -88}, {-26, -86}}, color = {0, 0, 127}));
      connect(as3.y, g3.u) annotation(
        Line(points = {{-2, -80}, {8, -80}}, color = {0, 0, 127}));
      connect(as3.u1, beta3.y) annotation(
        Line(points = {{-26, -74}, {-32, -74}, {-32, 40}}, color = {0, 0, 127}));
      connect(Cs.y, beta1.u) annotation(
        Line(points = {{-143, 86}, {-113, 86}, {-113, 62}, {-110, 62}}, color = {0, 0, 127}));
      connect(Cs.y, beta2.u) annotation(
        Line(points = {{-143, 86}, {-73, 86}, {-73, 62}, {-70, 62}}, color = {0, 0, 127}));
      connect(Cs.y, beta3.u) annotation(
        Line(points = {{-143, 86}, {-35, 86}, {-35, 62}, {-32, 62}}, color = {0, 0, 127}));
      connect(Pn3.y, add3.u3) annotation(
        Line(points = {{62, -80}, {90, -80}, {90, -28}}, color = {0, 0, 127}));
  connect(Pbal.y, Net.u) annotation(
        Line(points = {{140, -20}, {144, -20}, {144, -22}, {148, -22}}, color = {0, 0, 127}));
  connect(Net.y, fb.u) annotation(
        Line(points = {{171, -22}, {196, -22}, {196, -112}, {78, -112}}, color = {0, 0, 127}));
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        experiment(StartTime = 0, StopTime = 600, Tolerance = 1e-6, Interval = 1.2),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end BO_rigid_two_generators_PriSec;

    extends Modelica.Icons.Package;
    extends Icons.CourseworkModel;
  end ElecSys_power_frequency_control;

  package Icons
    partial package BlocksPackage
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(lineColor = {128, 128, 128}, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(origin = {-2, 9}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 2, extent = {{-40, 31}, {40, -49}}), Line(origin = {-61.5166, -0.463576}, points = {{-19, 0}, {19, 0}}, thickness = 2, arrow = {Arrow.None, Arrow.Open}, arrowSize = 8), Line(origin = {58.4834, -1.46358}, points = {{-21, 1}, {21, 1}}, thickness = 2, arrow = {Arrow.None, Arrow.Open}, arrowSize = 8)}));
    end BlocksPackage;

    partial package ComponentsPackage
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(lineColor = {128, 128, 128}, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(origin = {-30, -35.5}, lineColor = {46, 52, 54}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-30, 15.5}, {30, -24.5}}), Rectangle(origin = {30, -35.5}, lineColor = {46, 52, 54}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-30, 15.5}, {30, -24.5}}), Rectangle(origin = {30, 44.5}, lineColor = {46, 52, 54}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-30, 15.5}, {30, -24.5}}), Rectangle(origin = {0, 4.5}, lineColor = {46, 52, 54}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-30, 15.5}, {30, -24.5}}), Rectangle(origin = {45, 4.5}, lineColor = {46, 52, 54}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-15, 15.5}, {15, -24.5}})}));
    end ComponentsPackage;

    partial model ProcessBlock
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(fillColor = {245, 208, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
    end ProcessBlock;

    partial model ControlBlock
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
    end ControlBlock;

    partial package AnaloguePackage
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(lineColor = {128, 128, 128}, extent = {{-100, -100}, {100, 100}}, radius = 25), Ellipse(origin = {1, 0}, fillColor = {170, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-81, 80}, {81, -80}}, endAngle = 360), Line(origin = {1.31179, 9.26822}, points = {{-40.0158, -38.5594}, {-4.01585, 41.4406}, {39.9842, -38.5594}}, thickness = 2), Line(origin = {-3.70822, -11.2918}, points = {{-23, 2}, {31, 2}}, thickness = 2)}));
    end AnaloguePackage;

    partial model AnalogueController200x200
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        Icon(graphics = {Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Polygon(origin = {60, 60}, fillColor = {170, 255, 127}, fillPattern = FillPattern.Solid, points = {{-40, 40}, {40, -40}, {40, 40}, {-40, 40}}), Text(origin = {75, 75}, extent = {{-15, 15}, {15, -15}}, textString = "A")}, coordinateSystem(initialScale = 0.1)));
    end AnalogueController200x200;

    partial model AnalogueController200x400
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        Icon(graphics = {Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 200}, {100, -200}}), Polygon(origin = {60, 180}, fillColor = {170, 255, 127}, fillPattern = FillPattern.Solid, points = {{-20, 20}, {40, -40}, {40, 20}, {-20, 20}}), Text(origin = {82.3, 183.6}, extent = {{-14.3, 10.4}, {11.7, -15.6}}, textString = "A")}, coordinateSystem(extent = {{-100, -200}, {100, 200}}, initialScale = 0.1)));
    end AnalogueController200x400;

    partial package DigitalPackage
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(lineColor = {128, 128, 128}, extent = {{-100, -100}, {100, 100}}, radius = 25), Ellipse(origin = {1, 0}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-81, 80}, {81, -80}}, endAngle = 360), Polygon(origin = {4, 0}, lineThickness = 2, points = {{-30, 40}, {10, 40}, {30, 20}, {30, -20}, {10, -40}, {-30, -40}, {-30, 40}})}));
    end DigitalPackage;

    partial model DigitalController200x200
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        Icon(graphics = {Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Polygon(origin = {60, 60}, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, points = {{-40, 40}, {40, -40}, {40, 40}, {-40, 40}}), Text(origin = {75, 75}, extent = {{-15, 15}, {15, -15}}, textString = "D")}, coordinateSystem(initialScale = 0.1)));
    end DigitalController200x200;

    partial model DigitalController200x400
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        Icon(graphics = {Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 200}, {100, -200}}), Polygon(origin = {60, 180}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, points = {{-20, 20}, {40, -40}, {40, 20}, {-20, 20}}), Text(origin = {82.5, 183.6}, extent = {{-16.5, 10.4}, {13.5, -15.6}}, textString = "D")}, coordinateSystem(extent = {{-100, -200}, {100, 200}}, initialScale = 0.1)));
    end DigitalController200x400;

    partial model CourseworkModel
      annotation(
        Icon(graphics = {Ellipse(origin = {-10, -20}, fillPattern = FillPattern.Solid, extent = {{-30, 11}, {30, -11}}, endAngle = 360), Rectangle(origin = {-10, -5}, fillPattern = FillPattern.Solid, extent = {{-30, 15}, {30, -15}}), Polygon(origin = {-10, 10}, fillPattern = FillPattern.Solid, points = {{-20, 20}, {60, 20}, {20, -20}, {-60, -20}, {-20, 20}}), Rectangle(origin = {30, -15}, fillPattern = FillPattern.Solid, extent = {{0, 27}, {1, -27}}), Ellipse(origin = {30.5, -45}, fillPattern = FillPattern.Solid, extent = {{-3, 4}, {3, -4}}, endAngle = 360)}));
    end CourseworkModel;

    partial model TestModel
      annotation(
        Icon(graphics = {Polygon(lineColor = {78, 154, 6}, fillColor = {78, 154, 6}, fillPattern = FillPattern.Solid, points = {{-30, 40}, {30, 40}, {30, 20}, {10, 20}, {10, -40}, {-10, -40}, {-10, 20}, {-30, 20}, {-30, 40}}), Ellipse(origin = {-0.255057, -0.00174027}, lineColor = {78, 154, 6}, lineThickness = 1, extent = {{-80.6482, 80.6261}, {80.6482, -80.6261}}, endAngle = 360)}));
    end TestModel;

    partial model Generator
      annotation(
        Icon(graphics = {Ellipse(fillColor = {211, 215, 207}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}}, endAngle = 360), Text(origin = {-1, -2}, lineColor = {32, 74, 135}, extent = {{-89, 82}, {89, -82}}, textString = "G")}));
    end Generator;

    partial model Load
      annotation(
        Icon(graphics = {Ellipse(fillColor = {211, 215, 207}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}}, endAngle = 360), Text(origin = {-1, -2}, lineColor = {164, 0, 0}, extent = {{-89, 82}, {89, -82}}, textString = "L")}));
    end Load;

    partial model PAconnection
      annotation(
        Icon(graphics = {Ellipse(fillColor = {211, 215, 207}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}}), Ellipse(lineColor = {85, 85, 127}, fillColor = {85, 85, 127}, fillPattern = FillPattern.Solid, extent = {{-30, 30}, {30, -30}})}));
    end PAconnection;

    partial model Settings
      annotation(
        Icon(graphics = {Polygon(origin = {-41, 43}, lineColor = {143, 89, 2}, fillColor = {143, 89, 2}, fillPattern = FillPattern.Solid, points = {{-25, -27}, {-9, -17}, {-9, -1}, {-3, 5}, {13, 5}, {19, -1}, {19, -17}, {35, -17}, {35, 3}, {15, 23}, {-5, 23}, {-25, 3}, {-25, -27}}), Polygon(origin = {-31, -23}, rotation = 180, lineColor = {143, 89, 2}, fillColor = {143, 89, 2}, fillPattern = FillPattern.Solid, points = {{-25, -23}, {-9, -17}, {-9, -1}, {-3, 5}, {13, 5}, {19, -1}, {19, -17}, {35, -17}, {35, 3}, {15, 23}, {-5, 23}, {-25, 3}, {-25, -23}}), Polygon(origin = {-36, 11}, lineColor = {143, 89, 2}, fillColor = {143, 89, 2}, fillPattern = FillPattern.Solid, points = {{-30, 5}, {14, -17}, {30, -11}, {-14, 15}, {-30, 5}}), Polygon(origin = {6, -3}, lineColor = {143, 89, 2}, lineThickness = 0.3, points = {{-96, 73}, {-76, 93}, {64, 93}, {84, 73}, {84, -67}, {64, -87}, {-76, -87}, {-96, -67}, {-96, 73}})}));
    end Settings;

    extends Modelica.Icons.IconsPackage;
    annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
  end Icons;
  annotation(
    uses(Modelica(version = "4.0.0")));
end AES_project;
