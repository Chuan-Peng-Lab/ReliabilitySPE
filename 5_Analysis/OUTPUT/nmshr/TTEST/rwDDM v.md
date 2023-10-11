
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    42 0.18 (0.30)
        r Target Stranger 42 0.15 (0.21)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        3.49   1  82  .065 .  
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
─────────────────────────────────────────────────────────────────────────────────────────────────
                                  t df     p     Difference [95% CI]  Cohen’s d [95% CI]     BF10
─────────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  -0.60 82  .547     -0.03 [-0.15, 0.08] -0.13 [-0.57, 0.30] 2.67e-01
─────────────────────────────────────────────────────────────────────────────────────────────────

