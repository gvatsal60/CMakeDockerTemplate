#pragma once
#ifndef _MEMLIB_H_
#define _MEMLIB_H_

#include <cassert>
#include <memory>

template <typename T> static void MemClean(const T *const arg) {
  assert(arg != nullptr);
  std::unique_ptr<const T> argPtr(arg);
}

template <typename T> static void MemArrClean(const T *const arg) {
  assert(arg != nullptr);
  std::unique_ptr<const T[]> argPtr(arg);
}

#endif
