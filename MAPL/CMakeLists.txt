esma_set_this()


esma_add_library (${this}
  SRCS MAPL.F90
#<<<<<<< HEAD # try to keep what we had originally, but add in MAPL.gridcomps depend

# GCHP: Add ESMF to dependencies and do not put in includes
#  DEPENDENCIES MAPL.base MAPL.pfio MAPL_cfio_r4
#  INCLUDES ${INC_ESMF}
  DEPENDENCIES MAPL.base MAPL.pfio MAPL_cfio_r4 MAPL.gridcomps ESMF
#=======
#  DEPENDENCIES MAPL.base MAPL.pfio MAPL_cfio_r4 MAPL.gridcomps
#               esmf NetCDF::NetCDF_Fortran MPI::MPI_Fortran
#  TYPE SHARED
#>>>>>>> gmao/v2.6.4
  )

# GCHP dev note: add this for v2.6.4 to avoid how GMAO does it
target_include_directories (${this} PUBLIC ${INC_ESMF} ${INC_NETCDF})
target_link_libraries (${this} PUBLIC ${ESMF_LIBRARIES} ${NETCDF_LIBRARIES} ${MPI_Fortran_LIBRARIES})

target_include_directories (${this} PUBLIC
          $<BUILD_INTERFACE:${MAPL_SOURCE_DIR}/include>)
