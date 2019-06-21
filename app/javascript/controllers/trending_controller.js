import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "language", "since" ]

  initialize() {
    const currentSince = this.data.get('since');
    this.sinceTargets.forEach((v) => {
      const elemSince = v.dataset.trendingOrigin;
      if (currentSince === elemSince) {
        $(v).addClass('current');
      }
    });
    $(this.languageTarget).on('change', this.handleLanguageChange);
    $(this.sinceTargets).on('click', this.handleSince);
  }
  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
  }
  handleLanguageChange = (e) => {
    const val = $(e.target).val();
    let since;

    this.sinceTargets.forEach((v) => {
      if ($(v).hasClass('current')) {
        since = v.dataset.trendingOrigin;
      }
    })
    this.goTrending(val, since);
    location.href = `${location.origin}${location.pathname}?lang=${val}&since=${since}`;
  }
  handleSince = (e) => {
    const since = e.target.dataset.trendingOrigin;
    const language = $(this.languageTarget).val();

    this.goTrending(language, since);
  }
  /**
   * 跳转到指定的trending
   * @param {String} lang 语言
   * @param {String} sicne 时间范围 daily weekly
   */
  goTrending = (lang, since) => {
    location.href = `${location.origin}${location.pathname}?lang=${lang}&since=${since}`;
  }
}
