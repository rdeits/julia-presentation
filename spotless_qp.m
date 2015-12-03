function y = spotless_qp()

  prog = spotsosprog();
  [prog, x] = prog.newFree(10, 1);
  prog = prog.withEqs(x([1,10]) - [0; 9]);
  obj = 0;
  for j = 2:10
    obj = obj + (x(j) - x(j-1))^2;
  end
  result = minimize(prog, obj, @spot_mosek);
  y = double(result.eval(x));
end