
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    42 0.10 (0.22)
        r Target Stranger 42 0.11 (0.15)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        3.33   1  82  .072 .  
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
───────────────────────────────────────────────────────────────────────────────────────────────
                                 t df     p     Difference [95% CI] Cohen’s d [95% CI]     BF10
───────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  0.11 82  .915      0.00 [-0.08, 0.09] 0.02 [-0.41, 0.46] 2.29e-01
───────────────────────────────────────────────────────────────────────────────────────────────

