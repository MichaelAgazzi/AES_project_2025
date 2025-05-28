package AES_project
  package ElecSys_power_frequency_control
    model BO_rigid_two_generators_PriSec
      extends AES.Icons.CourseworkModel;
      Modelica.Blocks.Sources.RealExpression N_Pe1(y = if time < 0 then 0 else if time < 3600 then 30e6 else if time < 7200 then 60e6 else if time < 10800 then 90e6 else if time < 14400 then 120e6 else if time < 18000 then 150e6 else if time < 21600 then 180e6 else if time < 25200 then 210e6 else if time < 28800 then 240e6 else if time < 32400 then 210e6 else if time < 36000 then 180e6 else 180e6) annotation(
        Placement(transformation(origin = {208, 54}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Feedback Pbal annotation(
        Placement(transformation(origin = {270, -40}, extent = {{-10, 10}, {10, -10}})));
      Modelica.Blocks.Continuous.TransferFunction g1(a = {80, 24, 1}, b = {1}) annotation(
        Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction g2(a = {80, 24, 1}, b = {1}) annotation(
        Placement(transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Gain Pn1(k = 50e6) annotation(
        Placement(transformation(origin = {166, 0}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Gain Pn2(k = 100e6) annotation(
        Placement(transformation(origin = {166, -40}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Add as1 annotation(
        Placement(transformation(origin = {-90, -6}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Add as2 annotation(
        Placement(transformation(origin = {-50, -46}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.Integrator Cs(k = 0.0020274) annotation(
        Placement(transformation(origin = {-162, 86}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction Cp1(a = {1}, b = {0.3379}) annotation(
        Placement(transformation(origin = {-162, -12}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction Cp2(a = {1}, b = {0.3379}) annotation(
        Placement(transformation(origin = {-162, -52}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Add3 add annotation(
        Placement(transformation(origin = {240, -40}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Add as3 annotation(
        Placement(transformation(origin = {-20, -86}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction g3(a = {80, 24, 1}, b = {1}) annotation(
        Placement(transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Gain Pn3(k = 120e6) annotation(
        Placement(transformation(origin = {166, -80}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction Cp3(a = {1}, b = {0.3379}) annotation(
        Placement(transformation(origin = {-162, -92}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction Net(a = {(55000*(2*3.14*50)^2), 0}, b = {1}, final y_start) annotation(
        Placement(transformation(origin = {312, -40}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Add as7 annotation(
        Placement(transformation(origin = {252, 34}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Sources.RealExpression N_Pe2(y = if time < 0 then 0 elseif time < 3600 then 30e6 else if time < 7200 then 60e6 else if time < 10800 then 30e6 else if time < 14400 then 60e6 else if time < 18000 then 90e6 else if time < 21600 then 120e6 else if time < 25200 then 150e6 else if time < 28800 then 120e6 else if time < 32400 then 150e6 else if time < 36000 then 180e6 else 180e6) annotation(
        Placement(transformation(origin = {208, 76}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Sources.RealExpression N_Pe3(y = if time < 0 then 0 else if time < 3600 then 30e6 else if time < 7200 then 60e6 else if time < 10800 then 90e6 else if time < 14400 then 120e6 else if time < 18000 then 90e6 else if time < 21600 then 60e6 else if time < 25200 then 30e6 else if time < 28800 then 60e6 else if time < 32400 then 90e6 else if time < 36000 then 120e6 else 120e6) annotation(
        Placement(transformation(origin = {208, 96}, extent = {{-10, -10}, {10, 10}})));
      TimeSwitchBlock1 Tertiary_control_1 annotation(
        Placement(transformation(origin = {-60, 148}, extent = {{-20, -16}, {20, 16}})));
      TimeSwitchBlock2 Tertiary_control_2 annotation(
        Placement(transformation(origin = {-60, 220}, extent = {{-20, -16}, {20, 16}})));
      TimeSwitchBlock3 Tertiary_control_3 annotation(
        Placement(transformation(origin = {-60, 294}, extent = {{-20, -18}, {20, 18}})));
      Modelica.Blocks.Sources.RealExpression fo(y = 0) annotation(
        Placement(transformation(origin = {-246, 86}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Feedback fbal annotation(
        Placement(transformation(origin = {-212, 86}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Add as4 annotation(
        Placement(transformation(origin = {6, 0}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Add as5 annotation(
        Placement(transformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Add as6 annotation(
        Placement(transformation(origin = {70, -80}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Sources.RealExpression fo1(y = -0.8) annotation(
        Placement(transformation(origin = {-246, 132}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Sources.RealExpression fo2(y = 0.8) annotation(
        Placement(transformation(origin = {-246, 112}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction g12(a = {25, 10, 1}, b = {80, 24, 1}) annotation(
        Placement(transformation(origin = {26, 74}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Continuous.TransferFunction g13(a = {25, 10, 1}, b = {80, 24, 1}) annotation(
        Placement(transformation(origin = {58, 76}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Continuous.TransferFunction g11(a = {25, 10, 1}, b = {80, 24, 1}) annotation(
        Placement(transformation(origin = {-6, 76}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = 1) annotation(
        Placement(transformation(origin = {132, 0}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = 1) annotation(
        Placement(transformation(origin = {132, -40}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Nonlinear.Limiter limiter3(uMax = 1) annotation(
        Placement(transformation(origin = {132, -80}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction g4(a = {25, 1}, b = {1}) annotation(
        Placement(transformation(origin = {222, 28}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Noise.NormalNoise normalNoise(samplePeriod = 500, sigma = 3e5) annotation(
        Placement(transformation(origin = {196, 28}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Gain Freq(k = 50) annotation(
        Placement(transformation(origin = {412, -40}, extent = {{-10, -10}, {10, 10}})));
    equation
      connect(Cp1.y, as1.u2) annotation(
        Line(points = {{-151, -12}, {-102, -12}}, color = {0, 0, 127}));
      connect(Cp2.y, as2.u2) annotation(
        Line(points = {{-151, -52}, {-62, -52}}, color = {0, 0, 127}));
      connect(add.y, Pbal.u1) annotation(
        Line(points = {{251, -40}, {262, -40}}, color = {0, 0, 127}));
      connect(Pbal.y, Net.u) annotation(
        Line(points = {{279, -40}, {300, -40}}, color = {0, 0, 127}));
      connect(Cp3.y, as3.u2) annotation(
        Line(points = {{-151, -92}, {-32, -92}}, color = {0, 0, 127}));
      connect(Cs.y, as1.u1) annotation(
        Line(points = {{-150, 86}, {-102, 86}, {-102, 0}}, color = {0, 0, 127}));
      connect(Cs.y, as2.u1) annotation(
        Line(points = {{-150, 86}, {-62, 86}, {-62, -40}}, color = {0, 0, 127}));
      connect(Cs.y, as3.u1) annotation(
        Line(points = {{-150, 86}, {-32, 86}, {-32, -80}}, color = {0, 0, 127}));
      connect(fbal.y, Cs.u) annotation(
        Line(points = {{-203, 86}, {-174, 86}}, color = {0, 0, 127}));
      connect(as1.y, as4.u2) annotation(
        Line(points = {{-78, -6}, {-6, -6}}, color = {0, 0, 127}));
      connect(as3.y, as6.u2) annotation(
        Line(points = {{-8, -86}, {58, -86}}, color = {0, 0, 127}));
      connect(as2.y, as5.u2) annotation(
        Line(points = {{-38, -46}, {28, -46}}, color = {0, 0, 127}));
      connect(fbal.y, Cp1.u) annotation(
        Line(points = {{-203, 86}, {-188, 86}, {-188, -12}, {-174, -12}}, color = {0, 0, 127}));
      connect(fbal.y, Cp2.u) annotation(
        Line(points = {{-203, 86}, {-188, 86}, {-188, -52}, {-174, -52}}, color = {0, 0, 127}));
      connect(fbal.y, Cp3.u) annotation(
        Line(points = {{-203, 86}, {-188, 86}, {-188, -92}, {-174, -92}}, color = {0, 0, 127}));
      connect(Pn2.y, add.u2) annotation(
        Line(points = {{178, -40}, {228, -40}}, color = {0, 0, 127}));
      connect(Pn1.y, add.u1) annotation(
        Line(points = {{178, 0}, {200, 0}, {200, -32}, {228, -32}}, color = {0, 0, 127}));
      connect(Pn3.y, add.u3) annotation(
        Line(points = {{178, -80}, {200, -80}, {200, -48}, {228, -48}}, color = {0, 0, 127}));
      connect(Net.y, fbal.u2) annotation(
        Line(points = {{324, -40}, {382, -40}, {382, -120}, {-212, -120}, {-212, 78}}, color = {0, 0, 127}));
      connect(as7.y, Pbal.u2) annotation(
        Line(points = {{264, 34}, {268, 34}, {268, -32}, {270, -32}}, color = {0, 0, 127}));
      connect(g11.y, as4.u1) annotation(
        Line(points = {{-6, 66}, {-6, 6}}, color = {0, 0, 127}));
      connect(g12.y, as5.u1) annotation(
        Line(points = {{26, 63}, {26, 66}, {28, 66}, {28, -34}}, color = {0, 0, 127}));
      connect(g13.y, as6.u1) annotation(
        Line(points = {{58, 66}, {58, -74}}, color = {0, 0, 127}));
      connect(as4.y, g1.u) annotation(
        Line(points = {{18, 0}, {88, 0}}, color = {0, 0, 127}));
      connect(as5.y, g2.u) annotation(
        Line(points = {{52, -40}, {88, -40}}, color = {0, 0, 127}));
      connect(as6.y, g3.u) annotation(
        Line(points = {{82, -80}, {88, -80}}, color = {0, 0, 127}));
      connect(g1.y, limiter1.u) annotation(
        Line(points = {{112, 0}, {120, 0}}, color = {0, 0, 127}));
      connect(limiter1.y, Pn1.u) annotation(
        Line(points = {{144, 0}, {154, 0}}, color = {0, 0, 127}));
      connect(g2.y, limiter2.u) annotation(
        Line(points = {{112, -40}, {120, -40}}, color = {0, 0, 127}));
      connect(limiter2.y, Pn2.u) annotation(
        Line(points = {{144, -40}, {154, -40}}, color = {0, 0, 127}));
      connect(g3.y, limiter3.u) annotation(
        Line(points = {{112, -80}, {120, -80}}, color = {0, 0, 127}));
      connect(limiter3.y, Pn3.u) annotation(
        Line(points = {{144, -80}, {154, -80}}, color = {0, 0, 127}));
      connect(g4.y, as7.u2) annotation(
        Line(points = {{233, 28}, {240, 28}}, color = {0, 0, 127}));
      connect(normalNoise.y, g4.u) annotation(
        Line(points = {{207, 28}, {210, 28}}, color = {0, 0, 127}));
      connect(Tertiary_control_1.y1, g11.u) annotation(
        Line(points = {{-30, 162}, {-6, 162}, {-6, 88}}, color = {0, 0, 127}));
      connect(Tertiary_control_1.y2, g12.u) annotation(
        Line(points = {{-30, 154}, {26, 154}, {26, 86}}, color = {0, 0, 127}));
      connect(Tertiary_control_1.y3, g13.u) annotation(
        Line(points = {{-30, 146}, {58, 146}, {58, 88}}, color = {0, 0, 127}));
      connect(N_Pe1.y, as7.u1) annotation(
        Line(points = {{220, 54}, {240, 54}, {240, 40}}, color = {0, 0, 127}));
      connect(fo.y, fbal.u1) annotation(
        Line(points = {{-235, 86}, {-220, 86}}, color = {0, 0, 127}));
      connect(Net.y, Freq.u) annotation(
        Line(points = {{324, -40}, {400, -40}}, color = {0, 0, 127}));
      annotation(
        Diagram(coordinateSystem(extent = {{-500, -500}, {500, 500}})),
        experiment(StartTime = -10, StopTime = 40000, Tolerance = 1e-06, Interval = 4.001),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts",
        __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
        Icon(coordinateSystem(extent = {{-500, -500}, {500, 500}})));
    end BO_rigid_two_generators_PriSec;

    model TimeSwitchBlock1
      extends TimeSwitchBase(timeSteps = {3590, 7190, 10790, 14390, 17990, 21590, 25190, 28790, 32390, 35990}, P1 = {30e6/50e6, 0, 0, 36e6/50e6, 50e6/50e6, 0, 35.7431e6/50e6, 46.6467e6/50e6, 35.7431e6/50e6, 0}, P2 = {0, 60e6/100e6, 90e6/100e6, 84e6/100e6, 100e6/100e6, 86.0795e6/100e6, 83.8920e6/100e6, 91.4537e6/100e6, 83.8920e6/100e6, 86.0795e6/100e6}, P3 = {0, 0, 0, 0, 0, 93.9205e6/120e6, 90.3648e6/120e6, 101.8995e6/120e6, 90.3648e6/120e6, 93.9205e6/120e6});
    end TimeSwitchBlock1;

    // ───────────────────────────────────────────────────────

    model TimeSwitchBlock2
      extends TimeSwitchBase(timeSteps = {3590, 7190, 10790, 14390, 17990, 21590, 25190, 28790, 32390, 35990}, P1 = {30e6/50e6, 0, 30e6/50e6, 0, 0, 36e6/50e6, 50e6/50e6, 36e6/50e6, 50e6/50e6, 0}, P2 = {0, 60e6/100e6, 0, 60e6/100e6, 90e6/100e6, 84e6/100e6, 100e6/100e6, 84e6/100e6, 100e6/100e6, 93.9205e6/100e6}, P3 = {0, 0, 0, 0, 0, 0, 0, 0, 0, 86.0795e6/120e6});
    end TimeSwitchBlock2;

    // ───────────────────────────────────────────────────────

    model TimeSwitchBlock3
      extends TimeSwitchBase(timeSteps = {3590, 7190, 10790, 14390, 17990, 21590, 25190, 28790, 32390, 35990}, P1 = {30e6/50e6, 0, 0, 36e6/50e6, 0, 0, 30e6/50e6, 0, 0, 36e6/50e6}, P2 = {0, 60e6/100e6, 90e6/100e6, 84e6/100e6, 90e6/100e6, 60e6/100e6, 0, 60e6/100e6, 90e6/100e6, 84e6/100e6}, P3 = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0});
    end TimeSwitchBlock3;

    model TimeSwitchBase
      extends Modelica.Blocks.Icons.Block;
      parameter Real P1[10] "Values of P1 at each stage";
      parameter Real P2[10] "Values of P2 at each stage";
      parameter Real P3[10] "Values of P3 at each stage";
      parameter Real timeSteps[10] "Time step limits (in seconds)";
      Modelica.Blocks.Interfaces.RealOutput y1 annotation(
        Placement(transformation(extent = {{80, 40}, {100, 60}})));
      Modelica.Blocks.Interfaces.RealOutput y2 annotation(
        Placement(transformation(extent = {{80, 10}, {100, 30}})));
      Modelica.Blocks.Interfaces.RealOutput y3 annotation(
        Placement(transformation(extent = {{80, -20}, {100, 0}})));
    protected
      Integer idx;
    equation
      idx = if time < timeSteps[1] then 1 elseif time < timeSteps[2] then 2
       elseif time < timeSteps[3] then 3
       elseif time < timeSteps[4] then 4
       elseif time < timeSteps[5] then 5
       elseif time < timeSteps[6] then 6
       elseif time < timeSteps[7] then 7
       elseif time < timeSteps[8] then 8
       elseif time < timeSteps[9] then 9
       elseif time < timeSteps[10] then 10 else 10;
      y1 = if idx > 0 then P1[idx] else 0;
      y2 = if idx > 0 then P2[idx] else 0;
      y3 = if idx > 0 then P3[idx] else 0;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -60}, {60, 60}}), graphics = {Rectangle(extent = {{-50, 50}, {50, -50}}, fillColor = {200, 200, 255}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}), Text(extent = {{-45, 40}, {45, 20}}, textString = "Time", fontSize = 10, horizontalAlignment = TextAlignment.Center), Text(extent = {{-45, 20}, {45, 0}}, textString = "Switch", fontSize = 10, horizontalAlignment = TextAlignment.Center), // Output labels
        Text(extent = {{55, 20}, {75, 40}}, textString = "P1", fontSize = 8), Text(extent = {{55, -10}, {75, 10}}, textString = "P2", fontSize = 8), Text(extent = {{55, -40}, {75, -20}}, textString = "P3", fontSize = 8)}),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -60}, {60, 60}})));
    end TimeSwitchBase;

    // ───────────────────────────────────────────────────────
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
