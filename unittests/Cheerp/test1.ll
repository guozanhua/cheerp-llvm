; ModuleID = 'pa.cpp'
target datalayout = "b-e-p:32:8-i16:8-i32:8-i64:8-f32:8-f64:8-a:0:8-f80:8-n8:8:8-S8"
target triple = "cheerp--webbrowser"

%struct._Z1A = type { i32, i32, i32 }
%struct._ZN6client1BE = type { i32, i32, i32 }
%struct._Z4Base = type { i32 (...)** }
%struct._Z7Derived = type { i32 (...)**, %struct._Z4Base, i32 }

@_ZTV7Derived = linkonce_odr unnamed_addr constant [8 x i32 (...)*] [i32 (...)* null, i32 (...)* null, i32 (...)* bitcast (void (%struct._Z7Derived*)* @_ZN7DerivedD2Ev to i32 (...)*), i32 (...)* bitcast (void (%struct._Z7Derived*)* @_ZN7DerivedD0Ev to i32 (...)*), i32 (...)* inttoptr (i32 -4 to i32 (...)*), i32 (...)* null, i32 (...)* bitcast (void (%struct._Z4Base*)* @_ZTh1_N7DerivedD1Ev to i32 (...)*), i32 (...)* bitcast (void (%struct._Z4Base*)* @_ZTh1_N7DerivedD0Ev to i32 (...)*)]
@_ZTV4Base = linkonce_odr unnamed_addr constant [4 x i32 (...)*] [i32 (...)* null, i32 (...)* null, i32 (...)* bitcast (void (%struct._Z4Base*)* @_ZN4BaseD2Ev to i32 (...)*), i32 (...)* bitcast (void (%struct._Z4Base*)* @_ZN4BaseD0Ev to i32 (...)*)]

; Function Attrs: nounwind
define void @f1(i32* nocapture readonly %a, %struct._Z1A* nocapture %obj, %struct._ZN6client1BE* nocapture readonly %obj2) #0 {
entry:
  %0 = load i32* %a, align 1, !tbaa !2
  %a1 = getelementptr inbounds %struct._ZN6client1BE* %obj2, i32 0, i32 0
  %1 = load i32* %a1, align 1, !tbaa !6
  %add = add nsw i32 %1, %0
  %b = getelementptr inbounds %struct._Z1A* %obj, i32 1, i32 1
  store i32 %add, i32* %b, align 1, !tbaa !8
  ret void
}

; Function Attrs: nounwind
define %struct._Z1A* @f2(%struct._Z1A* %obj, i32* nocapture readonly %b) #0 {
entry:
  %0 = load i32* %b, align 1, !tbaa !2
  %b1 = getelementptr inbounds %struct._Z1A* %obj, i32 0, i32 1
  store i32 %0, i32* %b1, align 1, !tbaa !8
  ret %struct._Z1A* %obj
}

; Function Attrs: nounwind
define %struct._Z1A* @f3(%struct._Z1A* %obj, i32* nocapture readonly %b) #0 {
entry:
  %0 = load i32* %b, align 1, !tbaa !2
  %b1 = getelementptr inbounds %struct._Z1A* %obj, i32 0, i32 1
  store i32 %0, i32* %b1, align 1, !tbaa !8
  ret %struct._Z1A* %obj
}

; Function Attrs: nounwind
define void @f4(%struct._Z4Base* nocapture %p) #0 {
entry:
  %0 = tail call %struct._Z7Derived* @llvm.cheerp.downcast.P17struct._Z7Derived.P14struct._Z4Base(%struct._Z4Base* %p, i32 1)
  %c = getelementptr inbounds %struct._Z7Derived* %0, i32 0, i32 2
  store i32 18, i32* %c, align 1, !tbaa !10
  ret void
}

; Function Attrs: nounwind
declare %struct._Z7Derived* @llvm.cheerp.downcast.P17struct._Z7Derived.P14struct._Z4Base(%struct._Z4Base* nocapture, i32) #1

; Function Attrs: nounwind
define void @f5(%struct._Z4Base* nocapture %p) #0 {
entry:
  %0 = tail call %struct._Z7Derived* @llvm.cheerp.downcast.P17struct._Z7Derived.P14struct._Z4Base(%struct._Z4Base* %p, i32 1)
  %c = getelementptr inbounds %struct._Z7Derived* %0, i32 5, i32 2
  store i32 32, i32* %c, align 1, !tbaa !10
  ret void
}

; Function Attrs: nounwind
define void @_Z7webMainv() #0 {
entry:
  %a1 = alloca %struct._Z1A, align 1
  %a2 = alloca %struct._Z1A, align 1
  %a3 = alloca %struct._Z1A, align 1
  %b1 = alloca %struct._ZN6client1BE, align 1
  %c = alloca i32, align 1
  %d1 = alloca [10 x %struct._Z7Derived], align 1
  store i32 42, i32* %c, align 1, !tbaa !2
  %call = call %struct._Z1A* @f2(%struct._Z1A* %a1, i32* %c)
  call void @f1(i32* %c, %struct._Z1A* %call, %struct._ZN6client1BE* %b1)
  %call1 = call %struct._Z1A* @f2(%struct._Z1A* %a2, i32* %c)
  %call2 = call %struct._Z1A* @f3(%struct._Z1A* %a3, i32* %c)
  %array.begin = getelementptr inbounds [10 x %struct._Z7Derived]* %d1, i32 0, i32 0
  %arrayctor.end = getelementptr inbounds [10 x %struct._Z7Derived]* %d1, i32 0, i32 10
  br label %arrayctor.loop

arrayctor.loop:                                   ; preds = %arrayctor.loop, %entry
  %arrayctor.cur = phi %struct._Z7Derived* [ %array.begin, %entry ], [ %arrayctor.next, %arrayctor.loop ]
  call void @_ZN7DerivedC2Ev(%struct._Z7Derived* %arrayctor.cur) #1
  %arrayctor.next = getelementptr inbounds %struct._Z7Derived* %arrayctor.cur, i32 1
  %arrayctor.done = icmp eq %struct._Z7Derived* %arrayctor.next, %arrayctor.end
  br i1 %arrayctor.done, label %cast.notnull, label %arrayctor.loop

cast.notnull:                                     ; preds = %arrayctor.loop
  %0 = getelementptr [10 x %struct._Z7Derived]* %d1, i32 0, i32 4, i32 1
  call void @f4(%struct._Z4Base* %0)
  %1 = getelementptr [10 x %struct._Z7Derived]* %d1, i32 0, i32 2, i32 1
  call void @f5(%struct._Z4Base* %1)
  br label %arraydestroy.body

arraydestroy.body:                                ; preds = %arraydestroy.body, %cast.notnull
  %arraydestroy.elementPast = phi %struct._Z7Derived* [ %arrayctor.end, %cast.notnull ], [ %arraydestroy.element, %arraydestroy.body ]
  %arraydestroy.element = getelementptr inbounds %struct._Z7Derived* %arraydestroy.elementPast, i32 -1
  %arraydestroy.done = icmp eq %struct._Z7Derived* %arraydestroy.element, %array.begin
  br i1 %arraydestroy.done, label %arraydestroy.done8, label %arraydestroy.body

arraydestroy.done8:                               ; preds = %arraydestroy.body
  ret void
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: inlinehint nounwind
define linkonce_odr void @_ZN7DerivedC2Ev(%struct._Z7Derived* nocapture %this) unnamed_addr #2 align 2 {
entry:
  %0 = getelementptr %struct._Z7Derived* %this, i32 0, i32 1
  tail call void @_ZN4BaseC2Ev(%struct._Z4Base* %0) #1
  %1 = getelementptr inbounds %struct._Z7Derived* %this, i32 0, i32 0
  store i32 (...)** getelementptr inbounds ([8 x i32 (...)*]* @_ZTV7Derived, i32 0, i32 2), i32 (...)*** %1, align 1, !tbaa !12
  %2 = getelementptr %struct._Z7Derived* %this, i32 0, i32 1, i32 0
  store i32 (...)** getelementptr inbounds ([8 x i32 (...)*]* @_ZTV7Derived, i32 0, i32 6), i32 (...)*** %2, align 1, !tbaa !12
  ret void
}

; Function Attrs: inlinehint nounwind readnone
define linkonce_odr void @_ZN7DerivedD2Ev(%struct._Z7Derived* nocapture %this) unnamed_addr #3 align 2 {
entry:
  ret void
}

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind
define linkonce_odr void @_ZTh1_N7DerivedD1Ev(%struct._Z4Base* nocapture %this) unnamed_addr #0 align 2 {
entry:
  %0 = tail call %struct._Z7Derived* @llvm.cheerp.downcast.P17struct._Z7Derived.P14struct._Z4Base(%struct._Z4Base* %this, i32 1)
  ret void
}

; Function Attrs: inlinehint nounwind
define linkonce_odr void @_ZN4BaseC2Ev(%struct._Z4Base* nocapture %this) unnamed_addr #2 align 2 {
entry:
  %0 = getelementptr inbounds %struct._Z4Base* %this, i32 0, i32 0
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV4Base, i32 0, i32 2), i32 (...)*** %0, align 1, !tbaa !12
  ret void
}

; Function Attrs: inlinehint nounwind
define linkonce_odr void @_ZN7DerivedD0Ev(%struct._Z7Derived* %this) unnamed_addr #2 align 2 {
entry:
  %0 = bitcast %struct._Z7Derived* %this to i8*
  tail call void @_ZdlPv(i8* %0) #6
  ret void
}

; Function Attrs: nounwind
define linkonce_odr void @_ZTh1_N7DerivedD0Ev(%struct._Z4Base* nocapture %this) unnamed_addr #0 align 2 {
entry:
  %0 = tail call %struct._Z7Derived* @llvm.cheerp.downcast.P17struct._Z7Derived.P14struct._Z4Base(%struct._Z4Base* %this, i32 1)
  tail call void @_ZN7DerivedD0Ev(%struct._Z7Derived* %0) #1
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #4

; Function Attrs: nounwind readnone
define linkonce_odr void @_ZN4BaseD2Ev(%struct._Z4Base* nocapture %this) unnamed_addr #5 align 2 {
entry:
  ret void
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4BaseD0Ev(%struct._Z4Base* %this) unnamed_addr #0 align 2 {
entry:
  %0 = bitcast %struct._Z4Base* %this to i8*
  tail call void @_ZdlPv(i8* %0) #6
  ret void
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { inlinehint nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { builtin nounwind }

!struct._Z7Derived_bases = !{!0}
!llvm.ident = !{!1}

!0 = metadata !{i32 1, i32 2}
!1 = metadata !{metadata !"clang version 3.5.0 "}
!2 = metadata !{metadata !3, metadata !3, i64 0}
!3 = metadata !{metadata !"int", metadata !4, i64 0}
!4 = metadata !{metadata !"omnipotent char", metadata !5, i64 0}
!5 = metadata !{metadata !"Simple C/C++ TBAA"}
!6 = metadata !{metadata !7, metadata !3, i64 0}
!7 = metadata !{metadata !"_ZTSN6client1BE", metadata !3, i64 0, metadata !3, i64 4, metadata !3, i64 8}
!8 = metadata !{metadata !9, metadata !3, i64 4}
!9 = metadata !{metadata !"_ZTS1A", metadata !3, i64 0, metadata !3, i64 4, metadata !3, i64 8}
!10 = metadata !{metadata !11, metadata !3, i64 8}
!11 = metadata !{metadata !"_ZTS7Derived", metadata !3, i64 8}
!12 = metadata !{metadata !13, metadata !13, i64 0}
!13 = metadata !{metadata !"vtable pointer", metadata !5, i64 0}
