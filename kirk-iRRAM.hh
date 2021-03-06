
#ifndef KIRK_IRRAM_HH
#define KIRK_IRRAM_HH

#include <functional>		/* std::function */
#include <memory>		/* std::shared_ptr */

#include <iRRAM/REAL.h>		/* iRRAM::REAL */

#include "kirk-c-types.h"	/* kirk_real_t */

namespace kirk { namespace irram {

struct machine;

typedef std::function<void(const iRRAM::REAL *in,iRRAM::REAL *out)> func_type;

std::shared_ptr<machine> eval(::kirk_real_t *const *in, size_t n_in,
                              ::kirk_real_t **out     , size_t n_out,
                              func_type f);

iRRAM::REAL make_REAL(const ::kirk_real_t &, bool apx_abs = true);

void convert(iRRAM::sizetype &e, const ::kirk_bound_t &b);
void convert(::kirk_bound_t &b, const iRRAM::sizetype &e);

}}

#endif
