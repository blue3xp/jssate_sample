import { StateManager, createState, ANY } from 'jstates';
import {UIModel} from '../model/UIModel'

export const todosState = createState({
  "todos": new Array<UIModel>(),
});

export const added = (todos: UIModel[]) => {
  todosState.setState((s: Record<string, ANY>) => {
    return {
      "todos": [...s["todos"] as Array<UIModel>, ...todos],
    };
  });
};

export const done = (id: string) => {
  todosState.setState((s: Record<string, ANY>) => {
    const todos = s["todos"] as Array<UIModel>
    const item = todos.find((item) => item.id === id);
    if (item) {
      item.completed = !item.completed;
    }
    return {
      "todos": [...s["todos"] as Array<UIModel>],
    };
  });
};

