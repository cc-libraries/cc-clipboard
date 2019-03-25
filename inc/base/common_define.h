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

#ifndef CCLIB_CCSYS_API_COMMON_DEFINE_H
#define CCLIB_CCSYS_API_COMMON_DEFINE_H

#define CC_NULL NULL
#define CC_SUCCESS 1
#define CC_FAILED -1
#define CC_UI_FAILED 0

#define IS_POINT_NULL_POINT(point) \
if(NULL == point) {\
    return CC_NULL;\
}\

#define IS_POINT_NULL_INT(point) \
if(NULL == point) {\
    return CC_UI_FAILED;\
}\

#define IS_POINT_NULL_UINT(point) \
if(NULL == point) {\
    return CC_FAILED;\
}\

#endif //CCLIB_CCSYS_API_COMMON_DEFINE_H