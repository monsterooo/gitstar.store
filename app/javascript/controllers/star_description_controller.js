import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['description'];

  initialize() {
    $(this.descriptionTarget).on('blur', this.handleChange)
    $(this.descriptionTarget).on('keyup', this.handleChange)
  }
  connect() {
    
  }
  handleChange = (e) => {
    // TODO 触发修改条件需要优化，值更改才进行更新
    if (e.type === 'keyup' && e.keyCode !== 13) return;
    const value = $(e.target).text();

    $.ajax({
      url: '/repo_meta',
      type: 'POST',
      dataType: 'json',
      data: {
        'repo_metum[repo_id]': this.data.get('repoid'),
        'repo_metum[description]': value
      },
      success: (res) => {
        this.descriptionTarget.value = res.description;
      },
      error: () => {}
    });
  }
}
