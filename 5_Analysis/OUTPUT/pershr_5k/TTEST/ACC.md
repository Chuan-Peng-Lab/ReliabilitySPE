
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    14 0.31 (0.25)
        r Target Stranger 14 0.32 (0.19)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        1.45   1  26  .239    
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
───────────────────────────────────────────────────────────────────────────────────────────────
                                 t df     p     Difference [95% CI] Cohen’s d [95% CI]     BF10
───────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  0.11 26  .914      0.01 [-0.16, 0.18] 0.04 [-0.74, 0.82] 3.55e-01
───────────────────────────────────────────────────────────────────────────────────────────────

