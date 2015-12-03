function y = drake_qp()
  nv = 10;
  Q = zeros(nv, nv);
  for j = 2:nv
    Q(j,j) = Q(j,j) + 1;
    Q(j-1, j-1) = Q(j-1, j-1) + 1;
    Q(j, j-1) = Q(j, j-1) - 1;
    Q(j-1, j) = Q(j-1, j) - 1;
  end
  Aeq = zeros(2, nv);
  beq = zeros(2, 1);
  Aeq(1, 1) = 1;
  beq(1) = 0;
  Aeq(2, 10) = 1;
  beq(2) = 9;

  prog = QuadraticProgram(Q, zeros(nv, 1), [], [], Aeq, beq);
  prog = prog.setSolver('gurobi');
  y = prog.solve();
end
