<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 18:16
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TIdentificationProperties;

/**
 * Class MultilanguageString
 * @package Stopka\MediaFactory\Model\Database\Entities
 * @ORM\Entity()
 */
class MultilanguageString
{
    use TIdentificationProperties;

    /**
     * @var StringTranslationEntity[]|ArrayCollection
     * @ORM\OneToMany(targetEntity="StringTranslationEntity", mappedBy="multilanguageString", cascade={"all"}, orphanRemoval=true, indexBy="language_id")
     */
    private $translations;

    public function __construct()
    {
        $this->translations = new ArrayCollection();
    }

    public function setTranslation(LanguageEntity $language, string $value): void
    {
        /** @var StringTranslationEntity $translation */
        $translation = $this->translations->get($language->getId()->getBytes());
        if (!$translation) {
            $translation = new StringTranslationEntity($language, $this, $value);
            $this->translations->set($language->getId()->getBytes(), $translation);
        } else {
            $translation->setValue($value);
        }
    }

    public function getTranslation(LanguageEntity $language): ?string
    {
        /** @var StringTranslationEntity $translation */
        $translation = $this->translations->get($language->getId()->getBytes());
        if (!$translation) {
            return null;
        }
        return $translation->getValue();
    }

}
