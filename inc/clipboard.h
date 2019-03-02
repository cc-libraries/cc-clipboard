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

#ifndef CCLIB_CLIPBOARD_H_
#define CCLIB_CLIPBOARD_H_

#include "base/os.h"

namespace cclib {

class Clipboard {
public:
    Clipboard();
    virtual ~Clipboard() = 0;

public:
    virtual size_t foo() = 0;

protected:
    size_t flag;
}; //class clipboard

} //namespace cclib

#endif  // CCLIB_CLIPBOARD_H_