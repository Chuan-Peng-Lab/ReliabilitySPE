
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    14 0.09 (0.09)
        r Target Stranger 14 0.05 (0.09)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        0.00   1  26  .949    
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
─────────────────────────────────────────────────────────────────────────────────────────────────
                                  t df     p     Difference [95% CI]  Cohen’s d [95% CI]     BF10
─────────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  -1.12 26  .275     -0.04 [-0.11, 0.03] -0.42 [-1.20, 0.36] 5.61e-01
─────────────────────────────────────────────────────────────────────────────────────────────────

