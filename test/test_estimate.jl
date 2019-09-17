obs = [9.38058; 9.76652; 11.4661; 10.086; 10.1325; 11.6142; 10.5992; 8.6258; 9.18878; 9.52337; 11.204; 10.3993; 10.398; 10.1044; 9.49838; 11.6369; 10.6589; 7.83496; 11.1071; 9.41395; 8.86579; 9.75966; 8.99453; 9.23643; 9.36574; 8.34479; 11.0988; 10.1779; 8.85946; 11.3691; 10.5032; 9.6958; 10.8524; 10.8788; 10.8396; 10.7027; 10.5508; 9.94048; 9.72156; 9.6593; 9.37897; 9.80628; 8.86069; 12.3324; 12.0924; 8.35426; 9.47027; 9.49339; 10.7748; 9.91682; 10.2349; 9.97429; 9.96225; 11.1917; 9.75298; 11.481; 8.10715; 10.8092; 10.1411; 10.2142; 10.3529; 9.54254; 9.69554; 9.08409; 8.92653; 10.3253; 10.4355;10.0497; 10.8289; 12.0053; 9.23809; 7.24977; 11.9831; 8.95158; 9.17356; 11.1064; 9.68704; 8.80066; 10.2009; 9.86381; 10.0053; 10.343; 9.66946; 10.5743; 9.7966; 10.2974; 10.9768; 10.4428; 9.68766; 11.0573; 11.0428; 10.5897; 10.2385; 9.41362; 11.2815; 9.31883; 12.2613; 12.6291; 9.61586; 8.77585]
parameters = [10.0 1.2214; 10.0 1.02894; 10.0 0.884717; 10.0 1.48609; 10.0 1.05055; 10.0 0.88589; 10.0 1.69009; 10.0 1.17998; 10.0 1.39493; 10.0 1.14381; 10.0 0.96738; 10.0 1.23123; 10.0 0.986465; 10.0 0.889888;10.0 0.81443; 10.0 0.839127; 10.0 1.75167; 10.0 1.21197; 10.0 2.49184; 10.0 1.53647; 10.0 1.1282; 10.0 1.21577; 10.0 0.960372; 10.0 1.09741; 10.0 1.02973; 10.0 0.963018; 10.0 1.72012; 10.0 1.34537; 10.0 1.00422; 10.0 1.19237; 10.0 1.39234; 10.0 1.06286; 10.0 0.906873; 10.0 1.00144; 10.0 1.04446; 10.0 1.04133; 10.0 0.988868; 10.0 0.92414; 10.0 0.828211; 10.0 0.801845; 10.0 0.799131; 10.0 0.868089; 10.0 0.810647; 10.0 1.15644; 10.0 3.00046; 10.0 2.14722; 10.0 1.72881; 10.0 1.17856; 10.0 0.986679; 10.0 0.995392; 10.0 0.860216; 10.0 0.811198; 10.0 0.775368; 10.0 0.758244; 10.0 1.19709; 10.0 0.953791; 10.0 1.49371; 10.0 1.9161; 10.0 1.29769; 10.0 0.984255; 10.0 0.863918; 10.0 0.829355; 10.0 0.834877; 10.0 0.808577; 10.0 1.00314; 10.0 1.14884; 10.0 0.944035; 10.0 0.879349; 10.0 0.807684; 10.0 0.956813; 10.0 2.40762; 10.0 1.4185; 10.0 3.88788; 10.0 2.18542; 10.0 1.44289; 10.0 1.16377; 10.0 1.20778; 10.0 0.965281; 10.0 1.22737; 10.0 0.961417; 10.0 0.84802; 10.0 0.792615; 10.0 0.79525; 10.0 0.794373; 10.0 0.85104; 10.0 0.803728; 10.0 0.793162; 10.0 1.03552; 10.0 0.918325; 10.0 0.847009; 10.0 1.10177; 10.0 1.1563; 10.0 0.997798; 10.0 0.872097; 10.0 0.887044; 10.0 1.28777; 10.0 1.0688;10.0 2.94284; 10.0 2.65624; 10.0 1.4224; 10.0 1.33584]

push!(LOAD_PATH, "/home/guilhermebodin/Documents/Github/ScoreDrivenModels.jl/src")
using ScoreDrivenModels
using Distributions
using LinearAlgebra

# ω = [1.0; 0.1]
# A = convert(Matrix{Float64}, Diagonal([0.0; 0.5]))
# B = convert(Matrix{Float64}, Diagonal([0.9; 0.5]))
# dist = Normal()
# scaling = 0.0

ω = [NaN; NaN]
A = convert(Matrix{Float64}, Diagonal([NaN; NaN]))
B = convert(Matrix{Float64}, Diagonal([NaN; NaN]))
# ω = [1.0; 0.1]
# A = convert(Matrix{Float64}, Diagonal([0.0; 0.5]))
# B = convert(Matrix{Float64}, Diagonal([0.9; 0.5]))
dist = Normal()
scaling = 0.0

sd_model = SDModel(ω, A, B, dist, scaling)

ScoreDrivenModels.estimate_SDModel!(sd_model, obs; verbose = 2,
                                    random_seeds_lbfgs = ScoreDrivenModels.RandomSeedsLBFGS(10, ScoreDrivenModels.dimension_unkowns(sd_model)))

# ScoreDrivenModels.estimate_SDModel!(sd_model, obs; verbose = 2,
#                                     random_seeds_lbfgs = ScoreDrivenModels.RandomSeedsLBFGS([[1.0; 0.1; 0.0; 0.5; 0.9; 0.5]]))

sd_model
sd_model.ω./diag(I - sd_model.B)

param = score_driven_recursion(sd_model, obs)

using Plots
include("/home/guilhermebodin/Documents/Github/ScoreDrivenModels.jl/examples/Extras/useful_plots.jl")
plot_sdm(obs, param, sd_model.dist; quantiles = [0.025; 0.975])

params = hcat(param...)'
plot(params, label = ["\\mu estimado" "\\sigma estimado"])
plot!(parameters, label = ["\\mu real" "\\sigma real"])


#Testar isso
# ω = [1.0; 0.1]
# A = convert(Matrix{Float64}, Diagonal([0.0; NaN]))
# B = convert(Matrix{Float64}, Diagonal([0.9; 0.5]))
# dist = Normal()
# scaling = 0.0

# sd_model = SDModel(ω, A, B, dist, scaling)

# ScoreDrivenModels.estimate_SDModel!(sd_model, obs; verbose = 2,
#                                     random_seeds_lbfgs = ScoreDrivenModels.RandomSeedsLBFGS(10, ScoreDrivenModels.dimension_unkowns(sd_model)))