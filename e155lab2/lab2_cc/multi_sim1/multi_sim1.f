-L work
-reflib pmi_work
-reflib ovi_ice40up


"C:/Users/ccoggshall/Desktop/e155lab2/lab2_cc/source/impl_1/lab2_cc.sv" 
"C:/Users/ccoggshall/Desktop/e155lab2/lab2_cc/source/impl_1/seven_seg_display.sv" 
"C:/Users/ccoggshall/Desktop/e155lab2/lab2_cc/source/impl_1/multiplex.sv" 
"C:/Users/ccoggshall/Desktop/e155lab2/lab2_cc/source/impl_1/multi_testbench.sv" 
-sv
-optionset VOPTDEBUG
+noacc+pmi_work.*
+noacc+ovi_ice40up.*

-vopt.options
  -suppress vopt-7033
-end

-gui
-top multi_testbench
-vsim.options
  -suppress vsim-7033,vsim-8630,3009,3389
-end

-do "view wave"
-do "add wave /*"
-do "run 100 ns"
