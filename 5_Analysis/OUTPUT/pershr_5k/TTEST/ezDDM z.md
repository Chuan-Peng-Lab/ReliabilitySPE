
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    14 0.10 (0.17)
        r Target Stranger 14 0.08 (0.13)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        1.81   1  26  .190    
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
─────────────────────────────────────────────────────────────────────────────────────────────────
                                  t df     p     Difference [95% CI]  Cohen’s d [95% CI]     BF10
─────────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  -0.42 26  .679     -0.02 [-0.14, 0.09] -0.16 [-0.94, 0.62] 3.77e-01
─────────────────────────────────────────────────────────────────────────────────────────────────

