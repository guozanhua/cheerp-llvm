//===- IntrinsicsCheerp.td - Defines Cheerp intrinsics -----*- tablegen -*-===//
//
//                     Cheerp: The C++ compiler for the Web
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
// Copyright 2013 Leaning Technologies
//
//
//===----------------------------------------------------------------------===//
//
// This file defines all of the Cheerp-specific intrinsics.
//
//===----------------------------------------------------------------------===//


//===-------------------------- Cheerp Intrinsics --------------------------===//
//
// Casting helpers
def int_cheerp_downcast  : Intrinsic<[llvm_anyptr_ty],
                             [llvm_anyptr_ty, llvm_i32_ty],
                             [NoCapture<0>]>;

def int_cheerp_upcast_collapsed  : Intrinsic<[llvm_anyptr_ty],
                             [llvm_anyptr_ty],
                             [IntrNoMem]>;

def int_cheerp_cast_user  : Intrinsic<[llvm_anyptr_ty],
                             [llvm_anyptr_ty],
                             [IntrNoMem]>;

// Type safe memory allocation
def int_cheerp_allocate  : Intrinsic<[llvm_anyptr_ty],
                             [llvm_i32_ty]>;
def int_cheerp_reallocate  : Intrinsic<[llvm_anyptr_ty],
                             [llvm_anyptr_ty,llvm_i32_ty]>;
def int_cheerp_deallocate  : Intrinsic<[],
                             [llvm_ptr_ty]>;

// Type safe memory manipulation
def int_cheerp_element_distance  : Intrinsic<[llvm_i32_ty],
                             [llvm_anyptr_ty],
                             [IntrNoMem]>;

// Access to pointer components
def int_cheerp_pointer_base : Intrinsic<[llvm_anyptr_ty],
                                [llvm_ptr_ty],
                                [IntrNoMem]>;
def int_cheerp_pointer_offset : Intrinsic<[llvm_i32_ty],
                                [llvm_ptr_ty],
                                [IntrNoMem]>;

// Closure creation for callbacks
def int_cheerp_create_closure : Intrinsic<[llvm_anyptr_ty],
                                [llvm_anyptr_ty, llvm_anyptr_ty],
                                [IntrNoMem]>;

// Forging pointers of specific kinds
def int_cheerp_make_complete_object : Intrinsic<[llvm_anyptr_ty],
                                      [llvm_anyptr_ty],
                                      [IntrNoMem]>;
def int_cheerp_make_regular : Intrinsic<[llvm_anyptr_ty],
                                      [llvm_anyptr_ty, llvm_i32_ty],
                                      [IntrNoMem]>;
