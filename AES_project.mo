package AES_project
  package ElecSys_power_frequency_control
    model BO_rigid_Islanded_generator
      extends AES.Icons.CourseworkModel;
      Modelica.Blocks.Sources.RealExpression dPe(y = if time < 10 then 0 else 0.05) annotation(
        Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Feedback Pbal annotation(
        Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator N(k = 1/10) annotation(
        Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction Cps(a = {50, 0}, b = 0.5*{50, 1}) annotation(
        Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain fb(k = -1) annotation(
        Placement(visible = true, transformation(origin = {-10, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction g(a = {5, 1}, b = {1}) annotation(
        Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(Pbal.y, N.u) annotation(
        Line(points = {{40, 0}, {58, 0}}, color = {0, 0, 127}));
      connect(N.y, fb.u) annotation(
        Line(points = {{82, 0}, {100, 0}, {100, -30}, {2, -30}}, color = {0, 0, 127}));
      connect(fb.y, Cps.u) annotation(
        Line(points = {{-20, -30}, {-100, -30}, {-100, 0}, {-82, 0}}, color = {0, 0, 127}));
      connect(dPe.y, Pbal.u2) annotation(
        Line(points = {{1, 40}, {30, 40}, {30, 8}}, color = {0, 0, 127}));
      connect(Cps.y, g.u) annotation(
        Line(points = {{-58, 0}, {-22, 0}}, color = {0, 0, 127}));
      connect(g.y, Pbal.u1) annotation(
        Line(points = {{2, 0}, {22, 0}}, color = {0, 0, 127}));
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-6, Interval = 0.6),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end BO_rigid_Islanded_generator;

    model BO_rigid_two_generators_PriSec
      extends AES.Icons.CourseworkModel;
      Modelica.Blocks.Sources.RealExpression DPe(y = if time < 10 then 0 else 30e6) annotation(
        Placement(transformation(origin = {82, 30}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Feedback Pbal annotation(
        Placement(transformation(origin = {179, -40}, extent = {{-10, 10}, {10, -10}})));
      Modelica.Blocks.Continuous.Integrator N(k = 1/(55000*(2*3.14*50)^2)) annotation(
        Placement(transformation(origin = {219, -40}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Gain fb(k = -1) annotation(
        Placement(transformation(origin = {57, -125}, extent = {{10, -10}, {-10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction g1(a = {80, 24, 1}, b = {1}) annotation(
        Placement(transformation(origin = {59, 0}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction g2(a = {80, 24, 1}, b = {1}) annotation(
        Placement(transformation(origin = {59, -40}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Gain Pn1(k = 50e6) annotation(
        Placement(transformation(origin = {99, 0}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Gain Pn2(k = 100e6) annotation(
        Placement(transformation(origin = {99, -40}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Add as1 annotation(
        Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add as2 annotation(
        Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain beta1(k = 50/270) annotation(
        Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Math.Gain beta2(k = 100/270) annotation(
        Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Continuous.Integrator Cs(k = 2.0105e-05) annotation(
        Placement(transformation(origin = {-152, 86}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction Cp1(a = {1}, b = {0.2010}) annotation(
        Placement(visible = true, transformation(origin = {-150, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction Cp2(a = {1}, b = {0.2010}) annotation(
        Placement(visible = true, transformation(origin = {-150, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction g3(a = {80, 24, 1}, b = {1}) annotation(
        Placement(transformation(origin = {59, -84}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Gain Pn3(k = 120e6) annotation(
        Placement(transformation(origin = {99, -84}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Add as3 annotation(
        Placement(transformation(origin = {-4, -84}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction Cp21(a = {1}, b = {0.2010}) annotation(
        Placement(transformation(origin = {-150, -90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add3 add3 annotation(
        Placement(transformation(origin = {141, -40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain beta3(k = 120/270) annotation(
        Placement(transformation(origin = {-25, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    equation
      connect(Pbal.y, N.u) annotation(
        Line(points = {{188, -40}, {206, -40}}, color = {0, 0, 127}));
      connect(N.y, fb.u) annotation(
        Line(points = {{230, -40}, {248, -40}, {248, -125}, {69, -125}}, color = {0, 0, 127}));
      connect(DPe.y, Pbal.u2) annotation(
        Line(points = {{93, 30}, {179, 30}, {179, -32}}, color = {0, 0, 127}));
      connect(g1.y, Pn1.u) annotation(
        Line(points = {{70, 0}, {86, 0}}, color = {0, 0, 127}));
      connect(g2.y, Pn2.u) annotation(
        Line(points = {{70, -40}, {86, -40}}, color = {0, 0, 127}));
      connect(beta2.y, as2.u1) annotation(
        Line(points = {{-70, 39}, {-70, -34}, {-62, -34}}, color = {0, 0, 127}));
      connect(beta1.y, as1.u1) annotation(
        Line(points = {{-110, 39}, {-110, 6}, {-102, 6}}, color = {0, 0, 127}));
      connect(as1.y, g1.u) annotation(
        Line(points = {{-79, 0}, {47, 0}}, color = {0, 0, 127}));
      connect(Cp1.y, as1.u2) annotation(
        Line(points = {{-138, -6}, {-102, -6}}, color = {0, 0, 127}));
      connect(Cp2.y, as2.u2) annotation(
        Line(points = {{-139, -46}, {-62, -46}}, color = {0, 0, 127}));
      connect(fb.y, Cp2.u) annotation(
        Line(points = {{46, -125}, {-180, -125}, {-180, -46}, {-162, -46}}, color = {0, 0, 127}));
      connect(Cp2.u, Cp1.u) annotation(
        Line(points = {{-162, -46}, {-180, -46}, {-180, -6}, {-162, -6}}, color = {0, 0, 127}));
      connect(Cp1.u, Cs.u) annotation(
        Line(points = {{-162, -6}, {-180, -6}, {-180, 86}, {-164, 86}}, color = {0, 0, 127}));
      connect(as2.y, g2.u) annotation(
        Line(points = {{-39, -40}, {47, -40}}, color = {0, 0, 127}));
      connect(g3.y, Pn3.u) annotation(
        Line(points = {{70, -84}, {87, -84}}, color = {0, 0, 127}));
      connect(Cp21.y, as3.u2) annotation(
        Line(points = {{-139, -90}, {-16, -90}}, color = {0, 0, 127}));
      connect(as3.y, g3.u) annotation(
        Line(points = {{7, -84}, {47, -84}}, color = {0, 0, 127}));
  connect(Pn2.y, add3.u2) annotation(
        Line(points = {{110, -40}, {128, -40}}, color = {0, 0, 127}));
  connect(Pn1.y, add3.u1) annotation(
        Line(points = {{110, 0}, {128, 0}, {128, -32}}, color = {0, 0, 127}));
  connect(Pn3.y, add3.u3) annotation(
        Line(points = {{110, -84}, {129, -84}, {129, -48}}, color = {0, 0, 127}));
  connect(add3.y, Pbal.u1) annotation(
        Line(points = {{152, -40}, {170, -40}}, color = {0, 0, 127}));
  connect(Cs.y, beta3.u) annotation(
        Line(points = {{-140, 86}, {-25, 86}, {-25, 62}}, color = {0, 0, 127}));
  connect(Cs.y, beta2.u) annotation(
        Line(points = {{-140, 86}, {-70, 86}, {-70, 62}}, color = {0, 0, 127}));
  connect(Cs.y, beta1.u) annotation(
        Line(points = {{-140, 86}, {-110, 86}, {-110, 62}}, color = {0, 0, 127}));
  connect(beta3.y, as3.u1) annotation(
        Line(points = {{-24, 40}, {-26, 40}, {-26, -78}, {-16, -78}}, color = {0, 0, 127}));
  connect(fb.y, Cp21.u) annotation(
        Line(points = {{46, -124}, {-178, -124}, {-178, -90}, {-162, -90}}, color = {0, 0, 127}));
      annotation(
        Diagram(coordinateSystem(extent = {{-180, 100}, {180, -140}})),
        experiment(StartTime = 0, StopTime = 600, Tolerance = 1e-6, Interval = 1.2),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end BO_rigid_two_generators_PriSec;

    model PA_islanded_generator_loadDroop
      extends AES.Icons.CourseworkModel;
      Modelica.Blocks.Sources.RealExpression dPe(y = 20e6*(if time < 600 then 1 else 1.1)) annotation(
        Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction g(a = {1, 2, 1}, b = {30e6}) annotation(
        Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression fo(y = 50) annotation(
        Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      AES.ProcessComponents.Electric.Loads_PAport.Load_linear_droop L(Pnom = 20e6) annotation(
        Placement(visible = true, transformation(origin = {8, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.LimPID Cps(Ti = 80, controllerType = .Modelica.Blocks.Types.SimpleController.PI, k = 0.15, yMax = 1, yMin = 0) annotation(
        Placement(visible = true, transformation(origin = {-68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      AES.ProcessComponents.Electric.Generators_PAport.Generator_order0_prescribed_P G(Tox = 0.8, xi = 0.3) annotation(
        Placement(visible = true, transformation(origin = {8, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(dPe.y, L.Preq) annotation(
        Line(points = {{-18, 30}, {-2, 30}}, color = {0, 0, 127}));
      connect(fo.y, Cps.u_s) annotation(
        Line(points = {{-99, 0}, {-80, 0}}, color = {0, 0, 127}));
      connect(Cps.y, g.u) annotation(
        Line(points = {{-57, 0}, {-42, 0}}, color = {0, 0, 127}));
      connect(g.y, G.Pcmd) annotation(
        Line(points = {{-18, 0}, {-2, 0}}, color = {0, 0, 127}));
      connect(G.fg, Cps.u_m) annotation(
        Line(points = {{8, -10}, {8, -30}, {-68, -30}, {-68, -12}}, color = {0, 0, 127}));
      connect(L.port, G.port) annotation(
        Line(points = {{18, 30}, {28, 30}, {28, 0}, {18, 0}}, color = {0, 0, 255}));
    protected
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-6, Interval = 0.1),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end PA_islanded_generator_loadDroop;

    model PA_two_generators_loadDroop
      extends AES.Icons.CourseworkModel;
      Modelica.Blocks.Continuous.TransferFunction G1(a = {10, 1}, b = {10e6}*0.2) annotation(
        Placement(visible = true, transformation(origin = {44, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction G2(a = {15, 1}, b = {30e6}) annotation(
        Placement(visible = true, transformation(origin = {44, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add as1 annotation(
        Placement(visible = true, transformation(origin = {-36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add as2 annotation(
        Placement(visible = true, transformation(origin = {4, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain beta1(k = 0.25) annotation(
        Placement(visible = true, transformation(origin = {-56, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Math.Gain beta2(k = 0.75) annotation(
        Placement(visible = true, transformation(origin = {-16, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Continuous.Integrator Cs(k = 0.03*0.5) annotation(
        Placement(visible = true, transformation(origin = {-96, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction Cp1(a = {1}, b = {1.5}) annotation(
        Placement(visible = true, transformation(origin = {-76, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction Cp2(a = {1}, b = {1.5}) annotation(
        Placement(visible = true, transformation(origin = {-76, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      AES.ProcessComponents.Electric.Generators_PAport.Generator_order0_prescribed_P Ge1(Prated = 10e6, Tox = 2, dnom = 10, xi = 0.1) annotation(
        Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      AES.ProcessComponents.Electric.Generators_PAport.Generator_order0_prescribed_P Ge2(Tox = 3, dnom = 10) annotation(
        Placement(visible = true, transformation(origin = {80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Feedback fe1 annotation(
        Placement(visible = true, transformation(origin = {-108, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Feedback fe2 annotation(
        Placement(visible = true, transformation(origin = {-108, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Feedback fes annotation(
        Placement(visible = true, transformation(origin = {-128, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression fo(y = 50) annotation(
        Placement(visible = true, transformation(origin = {-170, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      AES.ProcessComponents.Electric.Loads_PAport.Load_prescribed_P L1 annotation(
        Placement(visible = true, transformation(origin = {120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      AES.ProcessComponents.Electric.Loads_PAport.Load_linear_droop L2 annotation(
        Placement(visible = true, transformation(origin = {120, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression Pe1(y = 35e6) annotation(
        Placement(visible = true, transformation(origin = {160, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression Pe2(y = if time < 500 then 5e6 else 15e6) annotation(
        Placement(visible = true, transformation(origin = {160, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    equation
      connect(beta2.y, as2.u1) annotation(
        Line(points = {{-16, 39}, {-16, -34}, {-8, -34}}, color = {0, 0, 127}));
      connect(beta1.y, as1.u1) annotation(
        Line(points = {{-56, 39}, {-56, 6}, {-48, 6}}, color = {0, 0, 127}));
      connect(as1.y, G1.u) annotation(
        Line(points = {{-25, 0}, {32, 0}}, color = {0, 0, 127}));
      connect(Cs.y, beta1.u) annotation(
        Line(points = {{-85, 80}, {-57, 80}, {-57, 62}}, color = {0, 0, 127}));
      connect(Cs.y, beta2.u) annotation(
        Line(points = {{-85, 80}, {-17, 80}, {-17, 62}}, color = {0, 0, 127}));
      connect(Cp1.y, as1.u2) annotation(
        Line(points = {{-65, -6}, {-48, -6}}, color = {0, 0, 127}));
      connect(Cp2.y, as2.u2) annotation(
        Line(points = {{-65, -46}, {-8, -46}}, color = {0, 0, 127}));
      connect(as2.y, G2.u) annotation(
        Line(points = {{15, -40}, {32, -40}}, color = {0, 0, 127}));
      connect(G1.y, Ge1.Pcmd) annotation(
        Line(points = {{55, 0}, {70, 0}}, color = {0, 0, 127}));
      connect(G2.y, Ge2.Pcmd) annotation(
        Line(points = {{55, -40}, {70, -40}}, color = {0, 0, 127}));
      connect(Ge1.fg, fe1.u2) annotation(
        Line(points = {{80, -10}, {80, -20}, {-108, -20}, {-108, -14}}, color = {0, 0, 127}));
      connect(Ge2.fg, fe2.u2) annotation(
        Line(points = {{80, -50}, {80, -62}, {-108, -62}, {-108, -54}}, color = {0, 0, 127}));
      connect(fe1.y, Cp1.u) annotation(
        Line(points = {{-99, -6}, {-89, -6}}, color = {0, 0, 127}));
      connect(fe2.y, Cp2.u) annotation(
        Line(points = {{-99, -46}, {-89, -46}}, color = {0, 0, 127}));
      connect(fes.y, Cs.u) annotation(
        Line(points = {{-119, 80}, {-109, 80}}, color = {0, 0, 127}));
      connect(fo.y, fes.u1) annotation(
        Line(points = {{-159, 80}, {-137, 80}}, color = {0, 0, 127}));
      connect(fo.y, fe1.u1) annotation(
        Line(points = {{-159, 80}, {-149, 80}, {-149, -6}, {-117, -6}}, color = {0, 0, 127}));
      connect(fo.y, fe2.u1) annotation(
        Line(points = {{-159, 80}, {-149, 80}, {-149, -46}, {-117, -46}}, color = {0, 0, 127}));
      connect(L1.port, L2.port) annotation(
        Line(points = {{110, 50}, {100, 50}, {100, 0}, {110, 0}}, color = {0, 0, 255}));
      connect(L2.port, Ge1.port) annotation(
        Line(points = {{110, 0}, {90, 0}}, color = {0, 0, 255}));
      connect(Ge1.port, Ge2.port) annotation(
        Line(points = {{90, 0}, {100, 0}, {100, -40}, {90, -40}}, color = {0, 0, 255}));
      connect(L1.fl, fes.u2) annotation(
        Line(points = {{120, 40}, {120, 28}, {-128, 28}, {-128, 72}}, color = {0, 0, 127}));
      connect(L2.Preq, Pe2.y) annotation(
        Line(points = {{130, 0}, {150, 0}}, color = {0, 0, 127}));
      connect(L1.P, Pe1.y) annotation(
        Line(points = {{130, 50}, {150, 50}}, color = {0, 0, 127}));
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-6, Interval = 0.2),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end PA_two_generators_loadDroop;
    
    model BO_rigid_two_generators_PriSec_2
      extends AES.Icons.CourseworkModel;
      Modelica.Blocks.Sources.RealExpression DPe(y = if time < 10 then 0 else 0) annotation(
        Placement(transformation(origin = {82, 30}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Feedback Pbal annotation(
        Placement(transformation(origin = {179, -38}, extent = {{-10, 10}, {10, -10}})));
      Modelica.Blocks.Continuous.Integrator N(k = 1/(55000*(2*3.14*50)^2)) annotation(
        Placement(transformation(origin = {219, -40}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Gain fb(k = 1) annotation(
        Placement(transformation(origin = {57, -125}, extent = {{10, -10}, {-10, 10}})));
      Modelica.Blocks.Continuous.Integrator Cs(k = 1.5e-2) annotation(
        Placement(transformation(origin = {-78, -2}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction g3(a = {80, 24, 1}, b = {1}) annotation(
        Placement(transformation(origin = {59, -84}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Gain Pn3(k = 120e6) annotation(
        Placement(transformation(origin = {99, -84}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Math.Add as3 annotation(
        Placement(transformation(origin = {-4, -84}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Continuous.TransferFunction Cp21(a = {1}, b = {2}) annotation(
        Placement(transformation(origin = {-88, -90}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Gain beta3(k = 1) annotation(
        Placement(transformation(origin = {-27, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback Pbal1 annotation(
        Placement(transformation(origin = {-129, -90}, extent = {{10, 10}, {-10, -10}}, rotation = -180)));
  Modelica.Blocks.Sources.RealExpression DPe1(y = if time < 10 then 0 else 10) annotation(
        Placement(transformation(origin = {-198, -90}, extent = {{-10, -10}, {10, 10}})));
    equation
      connect(Pbal.y, N.u) annotation(
        Line(points = {{188, -38}, {197, -38}, {197, -40}, {206, -40}}, color = {0, 0, 127}));
      connect(N.y, fb.u) annotation(
        Line(points = {{230, -40}, {248, -40}, {248, -125}, {69, -125}}, color = {0, 0, 127}));
      connect(DPe.y, Pbal.u2) annotation(
        Line(points = {{93, 30}, {93, 32}, {179, 32}, {179, -30}}, color = {0, 0, 127}));
      connect(g3.y, Pn3.u) annotation(
        Line(points = {{70, -84}, {87, -84}}, color = {0, 0, 127}));
      connect(Cp21.y, as3.u2) annotation(
        Line(points = {{-77, -90}, {-16, -90}}, color = {0, 0, 127}));
      connect(as3.y, g3.u) annotation(
        Line(points = {{7, -84}, {47, -84}}, color = {0, 0, 127}));
      connect(beta3.y, as3.u1) annotation(
        Line(points = {{-27, -51}, {-26, -51}, {-26, -78}, {-16, -78}}, color = {0, 0, 127}));
  connect(Pn3.y, Pbal.u1) annotation(
        Line(points = {{110, -84}, {171, -84}, {171, -38}}, color = {0, 0, 127}));
  connect(Pbal1.y, Cp21.u) annotation(
        Line(points = {{-120, -90}, {-100, -90}}, color = {0, 0, 127}));
  connect(fb.y, Pbal1.u2) annotation(
        Line(points = {{46, -124}, {-128, -124}, {-128, -98}}, color = {0, 0, 127}));
  connect(DPe1.y, Pbal1.u1) annotation(
        Line(points = {{-187, -90}, {-136, -90}}, color = {0, 0, 127}));
  connect(Cs.y, beta3.u) annotation(
        Line(points = {{-66, -2}, {-26, -2}, {-26, -28}}, color = {0, 0, 127}));
  connect(Pbal1.y, Cs.u) annotation(
        Line(points = {{-120, -90}, {-124, -90}, {-124, -2}, {-90, -2}}, color = {0, 0, 127}));
      annotation(
        Diagram(coordinateSystem(extent = {{-180, 100}, {180, -140}})),
        experiment(StartTime = 0, StopTime = 600, Tolerance = 1e-6, Interval = 1.2),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end BO_rigid_two_generators_PriSec_2;

    extends Modelica.Icons.Package;
    extends Icons.CourseworkModel;
  end ElecSys_power_frequency_control;
  
  package Icons
    
    partial package BlocksPackage
    
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, initialScale = 0.1), graphics={Rectangle( lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(lineColor = {128, 128, 128}, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(origin = {-2, 9}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 2, extent = {{-40, 31}, {40, -49}}), Line(origin = {-61.5166, -0.463576}, points = {{-19, 0}, {19, 0}}, thickness = 2, arrow = {Arrow.None, Arrow.Open}, arrowSize = 8), Line(origin = {58.4834, -1.46358}, points = {{-21, 1}, {21, 1}}, thickness = 2, arrow = {Arrow.None, Arrow.Open}, arrowSize = 8)}));
    end BlocksPackage;
    
    
    partial package ComponentsPackage
    
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, initialScale = 0.1), graphics={Rectangle( lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(lineColor = {128, 128, 128}, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(origin = {-30, -35.5}, lineColor = {46, 52, 54}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-30, 15.5}, {30, -24.5}}), Rectangle(origin = {30, -35.5}, lineColor = {46, 52, 54}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-30, 15.5}, {30, -24.5}}), Rectangle(origin = {30, 44.5}, lineColor = {46, 52, 54}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-30, 15.5}, {30, -24.5}}), Rectangle(origin = {0, 4.5}, lineColor = {46, 52, 54}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-30, 15.5}, {30, -24.5}}), Rectangle(origin = {45, 4.5}, lineColor = {46, 52, 54}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-15, 15.5}, {15, -24.5}})}));
    end ComponentsPackage;
    
    
    partial model ProcessBlock
    
      annotation (Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(fillColor = {245, 208, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
    end ProcessBlock;
    
    
    partial model ControlBlock
    
      annotation (Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
    end ControlBlock;
    
    
    partial package AnaloguePackage
    
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, initialScale = 0.1), graphics={Rectangle( lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(lineColor = {128, 128, 128}, extent = {{-100, -100}, {100, 100}}, radius = 25), Ellipse(origin = {1, 0}, fillColor = {170, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-81, 80}, {81, -80}}, endAngle = 360), Line(origin = {1.31179, 9.26822}, points = {{-40.0158, -38.5594}, {-4.01585, 41.4406}, {39.9842, -38.5594}}, thickness = 2), Line(origin = {-3.70822, -11.2918}, points = {{-23, 2}, {31, 2}}, thickness = 2)}));
    end AnaloguePackage;
    
    
    partial model AnalogueController200x200
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        Icon(graphics = {Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Polygon(origin = {60, 60}, fillColor = {170, 255, 127}, fillPattern = FillPattern.Solid, points = {{-40, 40}, {40, -40}, {40, 40}, {-40, 40}}), Text(origin = {75, 75}, extent = {{-15, 15}, {15, -15}}, textString = "A")}, coordinateSystem(initialScale = 0.1)));
    end AnalogueController200x200;
    
    
    partial model AnalogueController200x400
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        Icon(graphics = {Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 200}, {100, -200}}), Polygon(origin = {60, 180}, fillColor = {170, 255, 127}, fillPattern = FillPattern.Solid, points = {{-20, 20}, {40, -40}, {40, 20}, {-20, 20}}), Text(origin = {82.3, 183.6}, extent = {{-14.3, 10.4}, {11.7, -15.6}}, textString = "A")}, coordinateSystem(extent = {{-100, -200}, {100, 200}},initialScale = 0.1)));
    end AnalogueController200x400;
    
    
    partial package DigitalPackage
    
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, initialScale = 0.1), graphics={Rectangle( lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(lineColor = {128, 128, 128}, extent = {{-100, -100}, {100, 100}}, radius = 25), Ellipse(origin = {1, 0}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-81, 80}, {81, -80}}, endAngle = 360), Polygon(origin = {4, 0}, lineThickness = 2, points = {{-30, 40}, {10, 40}, {30, 20}, {30, -20}, {10, -40}, {-30, -40}, {-30, 40}})}));
    end DigitalPackage;
    
    
    partial model DigitalController200x200
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        Icon(graphics = {Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Polygon(origin = {60, 60}, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, points = {{-40, 40}, {40, -40}, {40, 40}, {-40, 40}}), Text(origin = {75, 75}, extent = {{-15, 15}, {15, -15}}, textString = "D")}, coordinateSystem(initialScale = 0.1)));
    end DigitalController200x200;
    
    
    partial model DigitalController200x400
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        Icon(graphics = {Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 200}, {100, -200}}), Polygon(origin = {60, 180}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, points = {{-20, 20}, {40, -40}, {40, 20}, {-20, 20}}), Text(origin = {82.5, 183.6}, extent = {{-16.5, 10.4}, {13.5, -15.6}}, textString = "D")}, coordinateSystem(extent = {{-100, -200}, {100, 200}},initialScale = 0.1)));
    end DigitalController200x400;
    
    
    partial model CourseworkModel
    
    annotation(
        Icon(graphics = {Ellipse(origin = {-10, -20}, fillPattern = FillPattern.Solid, extent = {{-30, 11}, {30, -11}}, endAngle = 360), Rectangle(origin = {-10, -5}, fillPattern = FillPattern.Solid, extent = {{-30, 15}, {30, -15}}), Polygon(origin = {-10, 10}, fillPattern = FillPattern.Solid, points = {{-20, 20}, {60, 20}, {20, -20}, {-60, -20}, {-20, 20}}), Rectangle(origin = {30, -15}, fillPattern = FillPattern.Solid, extent = {{0, 27}, {1, -27}}), Ellipse(origin = {30.5, -45}, fillPattern = FillPattern.Solid, extent = {{-3, 4}, {3, -4}}, endAngle = 360)}));
    end CourseworkModel;
    
    
    partial model TestModel
      annotation(
        Icon(graphics = {Polygon(lineColor = {78, 154, 6}, fillColor = {78, 154, 6}, fillPattern = FillPattern.Solid, points = {{-30, 40}, {30, 40}, {30, 20}, {10, 20}, {10, -40}, {-10, -40}, {-10, 20}, {-30, 20}, {-30, 40}}), Ellipse(origin = {-0.255057, -0.00174027},lineColor = {78, 154, 6}, lineThickness = 1, extent = {{-80.6482, 80.6261}, {80.6482, -80.6261}}, endAngle = 360)}));
    end TestModel;
    
    
    partial model Generator
      annotation(
        Icon(graphics = {Ellipse(fillColor = {211, 215, 207}, fillPattern = FillPattern.Solid,extent = {{-80, 80}, {80, -80}}, endAngle = 360), Text(origin = {-1, -2}, lineColor = {32, 74, 135}, extent = {{-89, 82}, {89, -82}}, textString = "G")}));
    end Generator;
    
    
    partial model Load
      annotation(
        Icon(graphics = {Ellipse(fillColor = {211, 215, 207}, fillPattern = FillPattern.Solid,extent = {{-80, 80}, {80, -80}}, endAngle = 360), Text(origin = {-1, -2}, lineColor = {164, 0, 0}, extent = {{-89, 82}, {89, -82}}, textString = "L")}));
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
  end Icons;annotation(
    uses(Modelica(version = "4.0.0")));
end AES_project;
