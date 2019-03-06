/*********************************************************************
 * cc-clipboard
 *
 * Copyright (c) 2019 cc-clipboard contributors:
 *   - hello_chenchen <https://github.com/hello-chenchen>
 *
 * MIT License <https://github.com/hello-chenchen/cc-clipboard/blob/master/LICENSE>
 * See https://github.com/hello-chenchen/cc-clipboard for the latest update to this file
 *
 * author: hello_chenchen <https://github.com/hello-chenchen>
 **********************************************************************************/

#ifndef CCLIB_OS_H_
#define CCLIB_OS_H_

namespace cclib {

#if !defined(IS_MACOSX) && defined(__APPLE__) && defined(__MACH__)
	#define IS_MACOSX
#endif /* IS_MACOSX */
}

#endif // CCLIB_OS_H_