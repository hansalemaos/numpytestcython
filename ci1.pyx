
cimport cython
import cython
import numpy as np
cimport numpy as np
from cython.parallel cimport prange
from libc.math cimport pow


cpdef np.ndarray[double] pow_cy1(np.ndarray[double] x):
    cdef np.ndarray[double] res = np.empty(len(x), dtype ='float')
    for i in range(len(x)):
        res[i] = pow(x[i], 2)
    return res

cpdef np.ndarray pow_cy2(double[:] x):
    cdef: 
        Py_ssize_t lenarray=x.shape[0]
        np.ndarray res_full = np.empty(lenarray, dtype ='float')
        double[:] res=res_full
        Py_ssize_t i 
    for i in range(lenarray):
        res[i] = pow(x[i], 2)
    return res_full

cpdef np.ndarray pow_cy3(double[:] x):
    cdef: 
        Py_ssize_t lenarray=x.shape[0]
        np.ndarray res_full = np.empty(lenarray, dtype ='float')
        double[:] res=res_full
        Py_ssize_t i 
    for i in range(lenarray):
        res[i] = (x[i] * x[i])
    return res_full

cpdef np.ndarray pow_cy4(double[:] x):
    cdef: 
        Py_ssize_t lenarray=x.shape[0]
        np.ndarray res_full = np.empty(lenarray, dtype ='float')
        double[:] res=res_full
        Py_ssize_t i 
    for i in prange(lenarray,nogil=True):
        res[i] = (x[i] * x[i])
    return res_full

