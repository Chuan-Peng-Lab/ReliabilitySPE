
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    34 0.42 (0.21)
        r Target Stranger 34 0.46 (0.20)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        0.33   1  66  .570    
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
───────────────────────────────────────────────────────────────────────────────────────────────
                                 t df     p     Difference [95% CI] Cohen’s d [95% CI]     BF10
───────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  0.83 66  .412      0.04 [-0.06, 0.14] 0.20 [-0.28, 0.68] 3.33e-01
───────────────────────────────────────────────────────────────────────────────────────────────

