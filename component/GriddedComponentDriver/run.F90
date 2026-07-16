#include "MAPL.h"

submodule(mapl3g_GriddedComponentDriver) run_smod
   use mapl_ErrorHandling
   implicit none(type,external)

contains

   module recursive subroutine run(this, unusable, phase_idx, rc)
      class(GriddedComponentDriver), target, intent(inout) :: this
      class(KE), optional, intent(in) :: unusable
      integer, optional, intent(in) :: phase_idx
      integer, optional, intent(out) :: rc

      integer :: status, user_status

      _ASSERT(present(phase_idx), 'until made not optional')

      ! ewl debug
      print *, "ewl debug: in run.F90:run. starting..."
      
      associate ( &
           importState => this%states%importState, &
           exportState => this%states%exportState)

      ! ewl debug
      print *, "ewl debug: in run.F90:run. import and export states associated"
      print *, "ewl debug: in run.F90:run. calling ESMF_GridCompRun"
        
        call ESMF_GridCompRun(this%gridcomp, &
             importState=importState, &
             exportState=exportState, &
             clock=this%clock, &
             phase=phase_idx, _USERRC)
      end associate

      print *, "ewl debug: in run.F90:run. done"

      _RETURN(_SUCCESS)
      _UNUSED_DUMMY(unusable)
   end subroutine run

end submodule run_smod
