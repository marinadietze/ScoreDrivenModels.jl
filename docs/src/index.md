# ScoreDrivenModels.jl Documentation

ScoreDrivenModels.jl is a Julia package for modeling, forecasting, and simulating time 
series with score-driven models, also known as generalized autoregressive score models (GAS). 
Implementations are based on the paper 
[Generalized Autoregressive Models with Applications](http://dx.doi.org/10.1002/jae.1279) 
by D. Creal, S. J. Koopman, and A. Lucas.

## Installation

This package is registered so you can simply `add` it using Julia's `Pkg` manager:
```julia
pkg> add ScoreDrivenModels
```

## Citing the package

If you use ScoreDrivenModels.jl in your work, we kindly ask you to cite the package [paper](https://arxiv.org/abs/2008.05506):

    @article{bodin2020scoredrivenmodels,
        title={ScoreDrivenModels. jl: a Julia Package for Generalized Autoregressive Score Models},
        author={Bodin, Guilherme and Saavedra, Raphael and Fernandes, Cristiano and Street, Alexandre},
        journal={arXiv preprint arXiv:2008.05506},
        year={2020}
    }


## Contributing

Contributions to this package are more than welcome, if you find a bug or have any suggestions 
for the documentation please post it on the 
[github issue tracker](https://github.com/LAMPSPUC/ScoreDrivenModels.jl/issues).

When contributing please note that the package follows the 
[JuMP style guide](https://jump.dev/JuMP.jl/stable/style/index.html).
