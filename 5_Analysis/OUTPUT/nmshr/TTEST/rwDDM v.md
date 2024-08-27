
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    68 0.20 (0.26)
        r Target Stranger 68 0.22 (0.21)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        1.95   1 134  .165    
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
────────────────────────────────────────────────────────────────────────────────────────────────
                                 t  df     p     Difference [95% CI] Cohen’s d [95% CI]     BF10
────────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  0.36 134  .719      0.01 [-0.06, 0.09] 0.06 [-0.28, 0.40] 1.95e-01
────────────────────────────────────────────────────────────────────────────────────────────────

