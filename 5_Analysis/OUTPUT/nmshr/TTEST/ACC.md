
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    68 0.38 (0.25)
        r Target Stranger 68 0.45 (0.24)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        0.14   1 134  .712    
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
────────────────────────────────────────────────────────────────────────────────────────────────
                                 t  df     p     Difference [95% CI] Cohen’s d [95% CI]     BF10
────────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  1.71 134  .089 .    0.07 [-0.01, 0.15] 0.29 [-0.05, 0.63] 6.95e-01
────────────────────────────────────────────────────────────────────────────────────────────────

