# Colossus Analysis

This project is an analysis of `colossus`, a 10-million-body globular cluster simulation run using Cluster Monte Carlo (CMC) code. We analyze hierarchical mergers within `colossus` and the `CMC Cluster Catalog` [Kremer et al. 2020](https://ui.adsabs.harvard.edu/abs/2020ApJS..247...48K%2F/abstract), and extrapolate binary black hole merger populations to the Virgo Cluster. For further context, see [Mai et al. (2025)](https://arxiv.org/abs/2510.21916).

## Notebook Files

- ### [ColossusAnalysis.ipynb](ColossusAnalysis.ipynb)

    - Contains the analysis of `colossus` and extrapolation of `CMC Cluster Catalog` properties to Virgo Cluster GCs. Included at the bottom is a portable function to predict BBH merger counts for any cluster mass and half-light radius, which can be used without any file dependencies (relevant CMC data is hardcoded within).

---

## Data Files

*Note:* For filesize considerations, all `colossus` files except for `BBHmergers_colossus.dat` and `initial.conv.sh` have been compressed, typically by removing all but every hundredth timestep. Regardless, these should have sufficient resolution for nearly all use cases. For the uncompressed originals, please visit the [CMC Catalog website](https://cmc.ciera.northwestern.edu/).

### Colossus files ([`colossus/`](colossus/))

- #### [bbh.esc.dat](colossus/bbh.esc.dat)

    - This file contains information about all binary black hole systems ejected from `colossus`, including information such as semimajor axis and orbital eccentricity. This file is a compressed form of `initial.esc.dat`, only containing information about ejected binary BH systems, instead of all ejected objects.

- #### [BBHmergers_colossus.dat](colossus/BBHmergers_colossus.dat)

    - This file contains binary black hole merger data for `colossus`. This file includes merger times, masses and spins of progenitor and product, GW kick velocity, and merger channel (1=ejected, 2=in-cluster binary, 3=in cluster 3-body, 4=in cluster 4-body, 5=in cluster 2-body GW capture).

- #### [initial.conv.sh](colossus/initial.conv.sh)

    - This file contains conversion factors used to convert from code units to physical units, for use in `small.dyn.dat`, `small.bh.dat`, and Lagrange radii files. For instance, to convert time in `small.dyn.dat` to Myr, multiply by `timeunitsmyr=14917.2`.

- #### [small.dyn.dat](colossus/small.dyn.dat)

    - This file contains various quantities pertaining to the dynamical evolution of `colossus`, such as core radius, half-light radius, total mass, central density, central velocity dispersion, etc. This file is a compressed version of `initial.dyn.dat`.

- #### [small.bh.dat](colossus/small.bh.dat)

    - This file contains the number of total BHs and BH binaries in `colossus` at each time step. This file is a compressed version of `initial.bh.dat`.

- #### [small.lagradStars.dat](colossus/small.lagradStars.dat)

    - This file contains Lagrange radii at 0.1%, 1%, 10%, 50%, and 90% thresholds for all objects in `colossus` between 0.1-1 solar masses, which is essentially all stars for most of the cluster's lifetime. This is a compressed version of `initial.lagrad0-0.1-1.dat`.

- #### [small.lagradBH.dat](colossus/small.lagradBH.dat)

    - This file contains the same data as `small.lagradStar.dat`, but for objects between 10-100 solar masses, which is all black holes at late times, and black hole progenitors at early times. This is a compressed version of `initial.lagrad2-10-100.dat`.



### CMC Catalog files ([`cmc_catalog/`](cmc_catalog/))

- #### [BBHmergers_CMCcatalog.dat](cmc_catalog/BBHmergers_CMCcatalog.dat)

    - This file contains binary black hole merger data for the `CMC Cluster Catalog`, a collection of 148 lower-mass GC simulations from [Kremer et al. (2020)](https://ui.adsabs.harvard.edu/abs/2020ApJS..247...48K%2F/abstract).

- #### [cluster_initial_params.dat](cmc_catalog/cluster_initial_params.dat)

    - This file contains initial N, virial radius, galactocentric radius, and metallicity for all `CMC Cluster Catalog` models and `colossus`, which is numbered 149.

- #### [cluster_params_all_final.dat](cmc_catalog/cluster_params_all_final.dat)

    - This file contains list of all cluster properties (e.g., total mass, core radius, half-light radius, etc.) at each late-time (t > 9 Gyr) snapshot for each CMC model. Present-day cluster parameters are obtained from this file.


### Virgo Cluster files ([`virgo/`](virgo/))

- #### [VCC.dat](virgo/VCC.dat)

    - This file contains Virgo Cluster Catalog IDs and their distance modulus. The distance to Virgo GCs are assumed to be the same distance as their host galaxy, obtained from this file.

- #### [Virgo_GCs.dat](virgo/Virgo_GCs.dat)

    - This file contains parameters of all GCs in the Virgo Cluster, from [Jordan et al. (2009)](https://ui.adsabs.harvard.edu/abs/2009ApJS..180...54J/abstract).
