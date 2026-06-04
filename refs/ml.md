# Machine Learning

This document contains notes about machine learning.


## Conda

*   conda: manages the entire scientific computing stack (Python +
    binaries + system libs) as one reproducible environment, not just
    Python packages (modern data science is built on top of compiled,
    non-Python scientific code)

| Tasks          | Conda                               | pip                             |
| ---            | ---                                 | ---                             |
| activate       | conda activate <myenv>              | source myenv/bin/activate       |
| deactivate     | conda deactivate                    | deactivate                      |
| install pkg(s) | conda install numpy <or more>       | pip install numpy <or more>     |
| update pkg(s)  | conda update numpy                  | pip install --upgrade numpy     |
| export env     | conda env export > environment.yml  | pip freeze > requirements.txt   |
| recreate env   | conda env create -f environment.yml | python -m venv myenv;           |
|                |                                     | pip install -r requirements.txt |
| list envs      | conda env list                      | na                              |
| list pkgs      | conda list                          | pip list                        |
| remove env     | conda remove -n myenv --all         | rm -rf myenv                    |

## pandas
```python
import pandas as pd
```

### Series

[Series](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series)

```python
data = pd.Series([10, 50, 42, 15], index=["apple", "banana", "cherry", "date"])

max_val = data.max()
index_max = data.
max_label = data.idxmax()
```

### DataFrame

[Data frame](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame)

```python
# Import
df = pd.read_csv("./data/sample.csv", index_col="Bottle", delimiter="\t",
        skiprows=1, skipfooter=2, engine="python", use_cols=list(range(1, 8)))

# Examine data
df.describe()   # generate descriptive statistics
df.info()       # concise summary of df
df.shape
df.dtypes       # return the dtypes in df
df.index        # row labels of df
df.columns      # column labels of df
df.values_counts()  # count frequency of distinct rows in the data frame

# Indexing
df['year'] # returns a Series, a column
df[['year']] # returns a DataFrame, a subtable
df.iloc[0:5] # position-based, exclude 5th row
df.loc[0:5]  # label-based, include 5th row

# Renaming
df = df.rename(columns = { "vol": "Volume" }) # reassignment is preferred, avoid
                                              #   in-place renaming

# Sub-setting and Filtering
df["year"]   # returns a pandas Series (type: pandas.Series)
df[["year"]] # returns a pandas subtable (type: pandas.DataFrame)
df[df["year"] > 2000]
df.query("year > 2000")

df.columns[df.iloc[0] < 10].tolist()  # select columns whose value in the first row is < 10
pd.isna(x)    # return True if x is NaN, False otherwise
pd.notna(x)

# Sorting
df.sort_values(by=["year"], ascending=False)

# Mutating
df.assign(new_feauture_name=df["feature1"] + df["feature2"])

# Export data frame
df.to_csv("./data/outcome.csv")

```

## numpy

```python
import numpy as np

numpy.newaxis # increases the dimension of the existing array by one more

arr.tolist()  # convert numpy array to normal python list
```


## matplotlib


## Scikit-learn

```python
# template
model = SelectedModel()         # specify parameters of model
model.fit(X, y)                 # learn the model
model.score(X, y)               # training score
model.score(X_valid, y_valid)   # validation score
model.predict(X_hat)            # predict on test data


from sklearn.dummy import DummyRegressor
from sklearn.tree import DecisionTreeRegressor

# splitting data
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# plot decision tree
from sklearn.tree import plot_tree
plot_tree(df, feature_names = X_train.columns.tolist(), impurity=False,
        filled=True, fontsize=10)
```

## References
*   [fff]()
