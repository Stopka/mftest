<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 18:06
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TIdentificationProperties;

/**
 * Class StringTranslationEntity
 * @package Stopka\MediaFactory\Model\Database\Entities\Translations
 * @ORM\Entity()
 */
class StringTranslationEntity
{
    use TIdentificationProperties;

    /**
     * @var string
     * @ORM\Column(type="text")
     */
    private $value;

    /**
     * @var LanguageEntity
     * @ORM\ManyToOne(targetEntity="LanguageEntity")
     */
    private $language;

    /**
     * @var MultilanguageString
     * @ORM\ManyToOne(targetEntity="MultilanguageString", inversedBy="translations")
     */
    private $multilanguageString;

    public function __construct(LanguageEntity $language, MultilanguageString $multilanguageString, string $value)
    {
        $this->language = $language;
        $this->multilanguageString = $multilanguageString;
        $this->value = $value;
    }

    /**
     * @return string
     */
    public function getValue(): string
    {
        return $this->value;
    }

    /**
     * @param string $value
     */
    public function setValue(string $value): void
    {
        $this->value = $value;
    }

    /**
     * @return LanguageEntity
     */
    public function getLanguage(): LanguageEntity
    {
        return $this->language;
    }

    /**
     * @return MultilanguageString
     */
    public function getMultilanguageString(): MultilanguageString
    {
        return $this->multilanguageString;
    }


}
