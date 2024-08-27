
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    68 0.50 (0.30)
        r Target Stranger 68 0.55 (0.20)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        9.84   1 134  .002 ** 
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
────────────────────────────────────────────────────────────────────────────────────────────────
                                 t  df     p     Difference [95% CI] Cohen’s d [95% CI]     BF10
────────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  1.06 134  .290      0.05 [-0.04, 0.13] 0.18 [-0.16, 0.52] 3.07e-01
────────────────────────────────────────────────────────────────────────────────────────────────

