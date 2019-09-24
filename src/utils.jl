function fill_psitilde!(gas_sarima::GAS_Sarima, psitilde::Vector{T}, unknowns_gas_sarima::Unknowns_GAS_Sarima) where T
    offset = 0
    # fill ω
    for i in unknowns_gas_sarima.ω
        offset += 1
        gas_sarima.ω[i] = psitilde[offset]
    end
    # fill A
    for (k, v) in unknowns_gas_sarima.A
        for i in v
            offset += 1
            gas_sarima.A[k][i] = psitilde[offset]
        end
    end
    # fill B
    for (k, v) in unknowns_gas_sarima.B
        for i in v
            offset += 1
            gas_sarima.B[k][i] = psitilde[offset]
        end
    end
    return 
end

function find_unknowns(vec::Vector{T}) where T
    return findall(isnan, vec)
end

function find_unknowns(mat::Matrix{T}) where T
    return findall(isnan, vec(mat))
end

function check_model_estimated(len::Int)
    if len == 0
        println("Score Driven Model does not have unknowns.")
        return true
    end
    return false
end

function num_params(dist::Distribution)
    return length(params(dist))
end

function NaN2zero!(score_til::Vector{T}) where T
    for i in eachindex(score_til)
        if isnan(score_til[i])
            score_til[i] = zero(T) 
        end
    end
    return 
end

function big_threshold!(score_til::Vector{T}, threshold::T) where T
    for i in eachindex(score_til)
        if score_til[i] >= threshold
            score_til[i] = threshold 
        end
        if score_til[i] <= -threshold
            score_til[i] = -threshold 
        end
    end
    return 
end

function small_threshold!(score_til::Vector{T}, threshold::T) where T
    for i in eachindex(score_til)
        if score_til[i] <= threshold && score_til[i] >= 0
            score_til[i] = threshold 
        end
        if score_til[i] >= -threshold && score_til[i] <= 0
            score_til[i] = -threshold 
        end
    end
    return 
end

function update_dist(dist::Distribution, param::Vector{T}) where T
    error("not implemented")
end 