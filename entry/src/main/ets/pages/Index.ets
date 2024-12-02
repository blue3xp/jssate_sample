import { ListTile } from '../component/ListTile';
import { UIModel } from '../model/UIModel';
import {todosState,added} from '../state/index'
import { ANY } from 'jstates';

@Entry
@Component
struct Index {
  @State data: UIModel[] = [];
  @Provide pageId: string = `${Date.now()}`;
  @State title: string = "";

  aboutToAppear(): void {
    todosState.subscribe((state: Record<string, ANY>) => {
      this.data = state.todos as Array<UIModel>;
      this.title = `.选中${this.data.filter((item) => item.completed).length}个`;
    });
    this.script();
  }


  script() {
    let mock: UIModel[] = [];
    for (let i = 0; i < 100; i++) {
      mock.push({
        id: `${i}${Date.now()}`,
        content: `${i}测试数据}`,
        completed: false
      });
    }
    added(mock)
  }

  build() {
    List({ space: 10 }) {
      ForEach(this.data, (item: UIModel) => {
        ListTile({ model: item, title: this.title })
      })
    }
    .width('100%').height('100%')
  }
}


