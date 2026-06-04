# Numpy

This document contains notes about Numpy.

Contents:
:InsertToc

## Notes Dump

```py
# Dimensions, axis, rows, and columns
m = 5
n = 4
ndarray = np.zeros((m, n)) # axis 0: vertical, axis 1: horizontal
ndarray.shape  # (4, 5)
ndarray.shape[0]  # number of rows:  4
ndarray.shape[1]  # number of columns:  5
ndarray[i, :]  # get row i
ndarray[:, j]  # get column j

np.column_stack((a, b))  # stack 1D arrays as columns into 2D array

np.bincount(arr)    # count the number of occurrences of each value in array of
                    #   non-negative values
                    # bincount([1, 4]) => [0, 1, 0, 0, 1]  freq
                    #                     [0, 1, 2, 3, 4]  values
```

*   Broadcasting Rules

    ```py
    a = np.array([1, 2, 3])  # shape (3, )
    b = np.array([10], [20]) # shape (2, 1)
    c = a + b
    # c = [[11,12,13],
    #      [21,22,23]]
    ```

*   Matrix Operations

    ```py
    from np.linalg import inv, det, solve
    A = np.array([[1, 2],
                [3, 4]])
    B = np.array([[5, 6],
                [7, 8]])
    C = A @ B           # matrix multiplication C = AB
    D = A * B           # element-wise multiplication
    A.T                 # transpose
    inv(A)              # inverse of matrix
    det(A)              # determinant
    solve(A, b)         # solve linear system
    arr = np.array([1, 2, 3])
    np.diag(arr)        # turn arr into diagonal matrix
    ```

## References
*   [Numpy User Guide](https://numpy.org/doc/stable/user/index.html)
