# FibPhotom

Fibre photometry analysis code. Feel free to use. Please acknowledge use of code/framework (e.g., via citation).

**Code:**
- **Bootstrapped CI** (with sqrt(n/(n-1)) expansion)**:**
  - one-sample (_boot_CIexp.m_)
  - between-subject comparisons (_boot_between_diffCIexp.m_)
  - within-subject comparisons (_boot_within_diffCIexp.m_)
- **Testing CI against null (0):** _sig_consec_thresh.m_ (uses _consec_idx.m_)
- **Kernel analysis:** _row_kern.m_, _kfitnorm_self.m_, _kfitnorm_compare.m_, _kfitcoeff_compare.m_
- **Behaviour timestamping:** _first_after.m_
- **Plots:** error region (_errorplot3.m_), colour repository (_col_rep.m_)


**Key references:**

- Jean-Richard-dit-Bressel et al. (2020). "Analyzing Event-Related Transients: Confidence Intervals, Permutation Tests, and Consecutive Thresholds", Front. Mol. Neurosci. https://doi.org/10.3389/fnmol.2020.00014
 _*provides outline and proof of concept for confidence interval and resampling-based analyses (i.e., bootstrapped confidence intervals, permutation tests) of fibre photometry data._

- Keevers & Jean-Richard-dit-Bressel (2025). "Obtaining artifact-corrected signals in fiber photometry via isosbestic signals, robust regression, and dF/F calculations", Neurophotonics https://doi.org/10.1117/1.NPh.12.2.025003
 _*considers various pre-processing steps for photometry; demonstrates benefits of low-pass filtering, iteratively-reweighted least squares, and dF/F calculations to derive artifact-corrected signals._

- Jean-Richard-dit-Bressel et al., (2022). "Instrumental aversion coding in the basolateral amygdala and its reversion by a benzodiazepine.", Neuropsychopharmacol. https://www.nature.com/articles/s41386-021-01176-2
 _*used one-sample & within-subjects waveform comparisons + normalised kernel fits (kfitnorm_compare.m) to assess inter-event/inter-session waveform similarity_


**Other relevant references:**

- Liu et al. (2020). "The Mesolimbic Dopamine Activity Signatures of Relapse to Alcohol-Seeking", J Neurosci. https://doi.org/10.1523/JNEUROSCI.0724-20.2020

- Choi, Jean-Richard-dit-Bressel et al.(2019). "Paraventricular Thalamus Controls Behavior during Motivational Conflict", J Neurosci. https://doi.org/10.1523/JNEUROSCI.2480-18.2019
 _*first paper (to our knowledge) to make use of bootstrapped confidence intervals to analyse fibre photometry data_
