Pkg.add("DatasetsCF");
Pkg.add("Persa");
Pkg.add("Plots");
Pkg.add("PyPlot");
Pkg.add("Plotly");

using DatasetsCF
using Persa
using Plots
using PyPlot
using Plotly
using DataFrames

dataset = DatasetsCF.MovieLens();
user_histogram = Persa.histogram_user(dataset); #dictionary of dictionary

# Get the total amount of ratings per user
user_rating_total = Dict{Int64, Int64}();
for (k, v) in user_histogram
    user_rating_total[k] = sum(values(v));
end

# Sort the rating amount by DESC
user_rating_pair = (sort(collect(user_rating_total), lt=isless, by = x -> x[2], rev=true));

# Create the graph data
users = Int64[]
ratings = Int64[]
for pair in user_rating_pair
    push!(users, pair[1]);
    push!(ratings, pair[2]);
end

# Plot the graph
println(ratings)
data = histogram(ratings)

# Q1 - The ratings of every user ordered
q1 = bar(ratings)

# Q2 - The histogram of ratings from 5 to 1
ratings_frequency = Int64[];
for dict_ratings in values(user_histogram)
    for i = 1:5
        if (dict_ratings[i] != 0) push!(ratings_frequency, i) end
    end
end
q2 = histogram(ratings_frequency);


# Q3 - Train a base with 80% of the data and use the other 20% to evaluate the trained model

dataset_train = # find out how to split a dataset
dataset_validation = # use the rest of the above dataset to validade the data

plotly()
plot(ratings, users, linewidth=2)
Plotly.set_credentials_file({"username"=>"jeffrbrito","api_key"=>"fOXzVm3v6bzWVq9LvxxU"})
