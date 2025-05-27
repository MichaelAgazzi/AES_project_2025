# AES_project_2025
# latex 
\documentclass{beamer}
\usepackage{amsmath}

\author{}
\date{}

\begin{document}
%--------------------------------------
\begin{frame}{Model Cost of the Generator}
\centering
\[
\left[c_{opt} + \frac{c_{mml} - c_{opt}}{(P_{opt} - P_{mml})^2} (P - P_{opt})^2 \right] P
\]

\vspace{1em}
Static generators parameters:

\begin{center}
\scriptsize
\renewcommand{\arraystretch}{0.8}
\resizebox{1.0\textwidth}{!}{%
\begin{tabular}{c|ccccc}
\hline
Generator & \(P_{nom}\) [MW] & \(P_{opt}\) [MW] & \(P_{mml}\) [MW] & \(c_{opt}\) [€/MWh] & \(c_{mml}\) [€/MWh] \\
\hline
\(G_1\) & 50 & 45 & 10 & 50 & 80 \\
\(G_2\) & 100 & 90 & 20 & 50 & 120 \\
\(G_3\) & 120 & 105 & 50 & 60 & 90 \\
\hline
\end{tabular}%
}
\renewcommand{\arraystretch}{1}
\end{center}




\includegraphics[width=\textwidth]{<model_cost_generator>}
\vspace{0.5em}

\end{frame}
%---------------------------------------
\begin{frame}{Problem Formulation}
Minimize total cost:
\[
\min_{\{P_i,u_i\}} \sum_{i=1}^3 \left[c_{opt,i} + \frac{c_{mml,i} - c_{opt,i}}{(P_{opt,i} - P_{mml,i})^2} (P_i - P_{opt,i})^2 \right] P_i u_i
\]
subject to
\[
P_{mml,i} u_i \leq P_i \leq P_{nom,i} u_i, \quad \sum_{i=1}^3 P_i = P_e, \quad u_i \in \{0,1\}
\]
where \(P_i\) is power output, \(u_i\) ON/OFF status, and \(P_e\) total demand.
\end{frame}
%---------------------------------------------------
\begin{frame}{Solution for the Tertiary Control}
\centering
\includegraphics[width=0.6\textwidth]{jpg/states_gen.jpg}
\vspace{0.5em}

\small We have use matlab as software, in particular we use fmincon() function to find the solution for this problem.
Because the problem is nonlinear with integer variables, we used brute force to test all combinations of the three generators for each power demand. For larger systems, nonlinear solvers or quadratic cost approximations would be more practical.
\end{frame}

%---------------------------------------------------
\begin{frame}{Result of Tertiary Control Optimisation}
\centering
\begin{minipage}{0.48\textwidth}
    \centering
    \includegraphics[width=\textwidth]{jpg/cost_vs_demand.jpg}
    \vspace{0.48em}
    
    \small Cost vs. demand
\end{minipage}
\hfill
\begin{minipage}{0.48\textwidth}
    \centering
    \includegraphics[width=\textwidth]{jpg/pe_vs_p_gen.jpg}
    \vspace{0.48em}
    
    \small Generator power vs. demand
\end{minipage}

\vspace{1em}
\centering
\small Summary of cost and power allocation after tertiary control optimisation.
\end{frame}

%---------------------------------------------------
\begin{frame}{Dynamic Model of the Generator}
\centering
 Each generator is modeled with a second-order dynamic transfer function characterized by time constants:
\[
\tau_1 = 20\, \mathrm{s}, \quad \tau_2 = 4\, \mathrm{s}.
\]
\[
G(s) = \frac{Pn}{(1 + s \tau_1)(1 + s \tau_2)}
\]

\includegraphics[width=\textwidth]{<generator_dynamic_model>}
\vspace{0.5em}

\end{frame}
% -------------------------------------------------
\begin{frame}{Network Dynamic Model}
The frequency deviation dynamics of the network is modeled as:
\[
\dot{\Delta \omega} = \frac{1}{J \omega_0^2} (\Delta P - \Delta P_e)
\]
where:
\begin{itemize}
  \item \(\Delta \omega\) is the frequency deviation,
  \item \(J\) is the network inertia,
  \item \(\omega_0 = 2 \pi f_0\) is the nominal angular frequency,
  \item \(\Delta P\) is the power injection ,
  \item \(\Delta P_e\) is the electrical power.
\end{itemize}
\end{frame}

%---------------------------------------------------
\begin{frame}{Primary and Secondary Control}
\centering
\includegraphics[width=\textwidth]{}
\vspace{0.5em}

\small Interaction between primary and secondary frequency control loops.
\end{frame}

%---------------------------------------------------
\begin{frame}{Model of the Disturbances}
\centering
\includegraphics[width=\textwidth]{<disturbance_model>}
\vspace{0.5em}

\small Disturbance inputs applied to the power-system model.
\end{frame}
%---------------------------------------------------
\begin{frame}{Final Response: settling time}
\centering
\includegraphics[width=\textwidth]{png/settling_time.png}
\vspace{0.5em}

\small The required settling time for the system’s response to a step change in demand is 10 minutes, equivalent to 600 seconds.


\end{frame}
%---------------------------------------------------
\begin{frame}{Final Frequency Response}
\centering
\includegraphics[width=\textwidth]{png/delta_freq.png}
\vspace{0.5em}

\small Overall system response: the nadir remains within acceptable limits. The final spike results from the failure of the tertiary control input. Beyond 36 ks, the system relies only on secondary and primary control.


\end{frame}

%---------------------------------------------------
\begin{frame}{Final Power Response}
\centering
\includegraphics[width=\textwidth]{png/delta_pe_1.png}
\vspace{0.5em}

\small Overall system power response.
\end{frame}

%---------------------------------------------------
\begin{frame}{Tertiary Control Input}
\centering
\includegraphics[width=\textwidth]{png/tertiary_control_1_percentage.png}
\vspace{0.5em}

\small Time history of the tertiary-control signal sent to generators.
\end{frame}

%---------------------------------------------------
\begin{frame}{Primary \& Secondary Control Signals}
\centering
\includegraphics[width=0.8\textwidth, height=4cm]{png/primary_control.png}
\vspace{0.1em}

\includegraphics[width=0.8\textwidth, height=4cm]{png/secondary_control.png}
\vspace{0.1em}

\small Primary and secondary control actions over time.
\end{frame}

%---------------------------------------------------
\begin{frame}{Total Control Input}
\centering
\includegraphics[width=\textwidth]{png/Total_control_input.png}
\vspace{0.5em}

\small Sum of primary, secondary, and tertiary inputs applied to the plant.
\end{frame}

%---------------------------------------------------

\end{document}

