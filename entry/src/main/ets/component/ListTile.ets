import { UIModel } from "../model/UIModel";
import {done} from "../state/index"


@Component
export struct ListTile {
  @Prop model: UIModel;
  @Prop title: string;

  build() {
    Text(`${this.model.content}${this.title}`)
      .width('100%').height(40)
      .backgroundColor(this.model.completed ? Color.Green : Color.White)
      .onClick(() => {
        done(this.model.id);
      })
  }
}