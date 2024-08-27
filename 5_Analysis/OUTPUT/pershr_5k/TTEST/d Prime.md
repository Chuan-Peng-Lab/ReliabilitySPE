
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    34 0.32 (0.17)
        r Target Stranger 34 0.32 (0.17)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        0.26   1  66  .610    
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
─────────────────────────────────────────────────────────────────────────────────────────────────
                                  t df     p     Difference [95% CI]  Cohen’s d [95% CI]     BF10
─────────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  -0.08 66  .936     -0.00 [-0.09, 0.08] -0.02 [-0.50, 0.46] 2.50e-01
─────────────────────────────────────────────────────────────────────────────────────────────────

