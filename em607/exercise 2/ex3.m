function [tf0, tf1] = ex3(sys, A, B, C, D)

    tf0 = tf(sys);

    tf1 = tf(ss(A, B, C, D)); % gets same of tf0
end