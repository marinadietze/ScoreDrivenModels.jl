using DelimitedFiles, Random, ScoreDrivenModels, Statistics

# Load historical Consumer Price Index data
y = vec(readdlm("../test/data/cpichg.csv"))

# Set RNG seed to guarantee consistent results
Random.seed!(123)

# Specify GAS model: a student's t model with location scale transformation
# (see /src/distributions/non_native_dists.jl in the repository)
gas = Model(1, 1, TDistLocationScale, 0.0, time_varying_params=[1, 2])

# Fit specified model to historical data
f = fit!(gas, y)

# Next, we show examples using nondefault keyword arguments
# Note that we need to re-define `gas` since its parameters were populated by `fit!`
gas = Model(1, 1, TDistLocationScale, 0.0, time_varying_params=[1, 2])

# In this example, we set verbose to 2, prompting the package to output optimization results
f = fit!(gas, y; verbose=2)

# Re-define `gas` once again for another example
gas = Model(1, 1, TDistLocationScale, 0.0, time_varying_params=[1, 2])

# In this example, we set the optimization method to LBFGS with 5 initial points
f = fit!(gas, y; opt_method=LBFGS(gas, 5))

# Print estimation statistics
fit_stats(f)

# Perform forecast via simulations for 12 time periods ahead
forec = forecast(y, gas, 12)

# We can access the parameter forecasts in `forec.parameter_forecasts`
forec.parameter_forecast

# Similarly, we can access the simulated observation scenarios
forec.observation_scenarios
