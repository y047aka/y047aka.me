import { section, h1, a, ul, li } from '@hyperapp/html'

export default () => state =>
  section([
    h1('I\'m belong to...'), 
    ul([
      li([
        a({ href: 'http://spacemgz-telstar.com/', target: '_blank' }, '宇宙広報団体 TELSTAR')
      ]),
      li([
        a({ href: 'https://sorabatake.jp/', target: '_blank' }, '宙畑')
      ])
    ]),

    h1('Github Pages'), 
    ul([
      li([
        a({ href: 'https://y047aka.github.io/MotorSportsCalandar/', target: '_blank' }, 'MotorSportsCalandar')
      ])
    ]),

    h1('Links'), 
    ul([
      li([
        a({ href: 'https://twitter.com/y047aka', target: '_blank' }, 'Twitter')
      ]),
      li([
        a({ href: 'https://github.com/y047aka', target: '_blank' }, 'GitHub')
      ])
    ])
  ])