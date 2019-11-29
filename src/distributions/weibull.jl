"""
Proof somewhere 
parametrized in \\alpha and \\theta
"""
function score(y::T, ::Type{Weibull}, param::Vector{T}) where T
    return [
        (1/param[1]) + log(y/param[2]) * (1 - (y/param[2])^param[1]) ;
        (param[1]/param[2]) * (((y/param[2])^param[1]) - 1)
    ]
end

"""
Proof somewhere
"""
function fisher_information(::Type{Weibull}, param::Vector{T}) where T
    return error("Fisher information not implemented for Weibull distribution.")
end

"""
Proof somewhere
"""
function log_likelihood(::Type{Weibull}, y::Vector{T}, param::Vector{Vector{T}}, n::Int) where T
    loglik = zero(T)
    for i in 1:n
        loglik += log(param[i][1]) + (param[i][1] - 1) * log(y[i]) - param[i][1] * log(param[i][2]) - (y[i]/param[i][2])^param[i][1]
    end
    return -loglik
end

# Links
function link(::Type{Weibull}, param::Vector{T}) where T 
    return [
        link(LogLink, param[1], zero(T));
        link(LogLink, param[2], zero(T))
    ]
end
function unlink(::Type{Weibull}, param_tilde::Vector{T}) where T 
    return [
        unlink(LogLink, param_tilde[1], zero(T));
        unlink(LogLink, param_tilde[2], zero(T))
    ]
end
function jacobian_link(::Type{Weibull}, param_tilde::Vector{T}) where T 
    return Diagonal([
        jacobian_link(LogLink, param_tilde[1], zero(T));
        jacobian_link(LogLink, param_tilde[2], zero(T))
    ])
end

# utils 
function update_dist(::Type{Weibull}, param::Vector{T}) where T
    # normal here is parametrized as sigma^2
    return Weibull(param[1], param[2])
end 

function num_params(::Type{Weibull})
    return 2
end