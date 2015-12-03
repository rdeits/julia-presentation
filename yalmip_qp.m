function y = yalmip_qp()
  x = sdpvar(10, 1, 'full');
  cost = 0;
  for j = 2:length(x)
    cost = cost + (x(j) - x(j-1))^2;
  end
  constraints = [x(1) == 0, x(end) == 9];
  params = sdpsettings('solver', 'gurobi', 'verbose', 0);
  optimize(constraints, cost, params);
  y = double(x);
end