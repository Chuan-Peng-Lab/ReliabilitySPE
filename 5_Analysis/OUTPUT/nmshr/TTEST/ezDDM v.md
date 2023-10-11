
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    42 0.28 (0.26)
        r Target Stranger 42 0.32 (0.24)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        0.02   1  82  .876    
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
───────────────────────────────────────────────────────────────────────────────────────────────
                                 t df     p     Difference [95% CI] Cohen’s d [95% CI]     BF10
───────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  0.76 82  .449      0.04 [-0.07, 0.15] 0.17 [-0.27, 0.60] 2.93e-01
───────────────────────────────────────────────────────────────────────────────────────────────

