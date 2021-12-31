import { createSlice } from "@reduxjs/toolkit";

const initialState = {
    //개별 운동 여부
    eachExercise: false,
    //코스 운동 여부
    courseExercise: false,
    //개별 운동 종류
    eachExerciseKind: '',
    //개별 운동 횟수
    eachExerciseToDo: 0,
    //코스 운동 횟수
    courseExerciseToDo: [],
    //완료한 개별 운동 횟수
    eachExerciseDone: 0,
    //완료한 코스 운동 횟수
    courseExerciseDone: [],
    //현재 진행되고 있는 운동
    nowExercise: '',
}

export const configureSlice = createSlice({
    name: 'configure',
    initialState,
    reducers: {
        configEachExercise: (state) => {
            state.eachExercise = true
        },
        configCourseExercise: (state) => {
            state.courseExercise = true
        },
        configEachExerciseKind: (state, action) => {
            
        }
    }
})

export const { configEachExercise, configCourseExercise } = configureSlice.actions;

export const selectEachExercise = (state) => state.configure.eachExercise;
export const selectCourseExercise = (state) => state.configure.courseExercise;
export const selectEachExerciseKind = (state) => state.configure.eachExerciseKind;
export const selectEachExerciseToDo = (state) => state.configure.eachExerciseToDo;
export const selectCourseExerciseToDo = (state) => state.configure.courseExerciseToDo;
export const selectEachExerciseDone = (state) => state.configure.eachExerciseDone;
export const selectCourseExerciseDone = (state) => state.configure.courseExerciseDone;
export const selectNowExercise = (state) => state.configure.nowExercise;

export default configureSlice.reducer;