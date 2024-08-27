
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    68 0.13 (0.20)
        r Target Stranger 68 0.15 (0.16)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        1.56   1 134  .214    
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
────────────────────────────────────────────────────────────────────────────────────────────────
                                 t  df     p     Difference [95% CI] Cohen’s d [95% CI]     BF10
────────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  0.57 134  .573      0.02 [-0.04, 0.08] 0.10 [-0.24, 0.44] 2.13e-01
────────────────────────────────────────────────────────────────────────────────────────────────

